param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$pass = New-Object System.Collections.Generic.List[string]
$fail = New-Object System.Collections.Generic.List[string]
$warn = New-Object System.Collections.Generic.List[string]

function Add-Pass([string]$Message) { $script:pass.Add($Message) | Out-Null }
function Add-Fail([string]$Message) { $script:fail.Add($Message) | Out-Null }
function Add-Warn([string]$Message) { $script:warn.Add($Message) | Out-Null }

function Get-RelativePath([string]$Path) {
    $full = [System.IO.Path]::GetFullPath($Path)
    $base = [System.IO.Path]::GetFullPath($Root).TrimEnd('\') + '\'
    if ($full.StartsWith($base, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $full.Substring($base.Length)
    }
    return $full
}

function Get-ActiveTextFiles {
    $roots = @('common', 'events', 'gfx', 'history', 'localization')
    foreach ($r in $roots) {
        $path = Join-Path $Root $r
        if (Test-Path -LiteralPath $path) {
            Get-ChildItem -LiteralPath $path -Recurse -File -ErrorAction SilentlyContinue |
                Where-Object {
                    $_.FullName -notmatch '\\_disabled_total_conversion_map\\' -and
                    $_.FullName -notmatch '\\_tc_staging\\' -and
                    $_.FullName -notmatch '\\_tc_activation_ready\\' -and
                    $_.Extension -in @('.txt', '.yml', '.gui', '.asset', '.mod')
                }
        }
    }
    foreach ($file in @('descriptor.mod')) {
        $path = Join-Path $Root $file
        if (Test-Path -LiteralPath $path) { Get-Item -LiteralPath $path }
    }
    $launcher = Join-Path (Split-Path $Root -Parent) 'JianghuDynastyTC.mod'
    if (Test-Path -LiteralPath $launcher) { Get-Item -LiteralPath $launcher }
}

function Find-ActivePattern([string]$Pattern, [switch]$Regex) {
    $found = New-Object System.Collections.Generic.List[string]
    foreach ($file in Get-ActiveTextFiles) {
        $matches = Select-String -LiteralPath $file.FullName -Pattern $Pattern -SimpleMatch:(!$Regex) -ErrorAction SilentlyContinue
        foreach ($m in $matches) {
            $found.Add(("{0}:{1}" -f (Get-RelativePath $m.Path), $m.LineNumber)) | Out-Null
        }
    }
    return $found
}

function Get-ActiveGameText([string]$SubPath) {
    $path = Join-Path $Root $SubPath
    if (Test-Path -LiteralPath $path) {
        return Get-ChildItem -LiteralPath $path -Recurse -File -Include *.txt,*.yml -ErrorAction SilentlyContinue
    }
    return @()
}

$currentVersion = $null

$descriptor = Join-Path $Root 'descriptor.mod'
if (Test-Path -LiteralPath $descriptor) {
    Add-Pass 'descriptor.mod exists'
    $descriptorText = Get-Content -LiteralPath $descriptor -Raw
    if ($descriptorText -match '(?m)^\s*version\s*=\s*"([^"]+)"') {
        $currentVersion = $Matches[1]
        Add-Pass "descriptor version is $currentVersion"
    } else {
        Add-Fail 'descriptor.mod is missing version'
    }
    if ($descriptorText -match 'supported_version\s*=\s*"1\.19\.\*"|supported_version\s*=\s*"[^"]*1\.19') {
        Add-Pass 'supported_version includes 1.19'
    } else {
        Add-Fail 'supported_version does not include 1.19'
    }
    if ($descriptorText -match 'replace_path\s*=') {
        Add-Fail 'descriptor.mod still contains replace_path entries'
    } else {
        Add-Pass 'descriptor.mod has no replace_path entries'
    }
} else {
    Add-Fail 'descriptor.mod is missing'
}

$launcherDescriptor = Join-Path (Split-Path $Root -Parent) 'JianghuDynastyTC.mod'
if (Test-Path -LiteralPath $launcherDescriptor) {
    Add-Pass 'launcher .mod file exists'
    $launcherText = Get-Content -LiteralPath $launcherDescriptor -Raw
    if ($launcherText -match '(?m)^\s*version\s*=') {
        Add-Pass 'launcher .mod has version'
    } else {
        Add-Fail 'launcher .mod is missing version'
    }
    if ($launcherText -match 'replace_path\s*=') {
        Add-Fail 'launcher .mod still contains replace_path entries'
    } else {
        Add-Pass 'launcher .mod has no replace_path entries'
    }
} else {
    Add-Warn 'launcher .mod file was not found next to the mod folder'
}

foreach ($path in @('map_data', 'common/bookmarks', 'common/landed_titles', 'history/provinces', 'history/titles')) {
    $full = Join-Path $Root ($path -replace '/', '\')
    if (Test-Path -LiteralPath $full) {
        Add-Fail "active $path folder exists"
    } else {
        Add-Pass "active $path folder does not exist"
    }
}

if (Test-Path -LiteralPath (Join-Path $Root 'localization')) {
    Add-Pass 'localization folder exists'
} else {
    Add-Fail 'localization folder is missing'
}

if (Test-Path -LiteralPath (Join-Path $Root 'events')) {
    Add-Pass 'events folder exists'
} else {
    Add-Fail 'events folder is missing'
}

if (Test-Path -LiteralPath (Join-Path $Root 'common/decisions')) {
    Add-Pass 'common/decisions exists'
} else {
    Add-Fail 'common/decisions is missing'
}

foreach ($doc in @('README.md', 'TESTING_CHECKLIST.md')) {
    if (Test-Path -LiteralPath (Join-Path $Root $doc)) {
        Add-Pass "$doc exists"
    } else {
        Add-Fail "$doc is missing"
    }
}

if ($currentVersion) {
    $changelog = Join-Path $Root ("CHANGELOG_v{0}.md" -f $currentVersion)
    if (Test-Path -LiteralPath $changelog) {
        Add-Pass "changelog for current version exists"
    } else {
        Add-Fail "CHANGELOG_v$currentVersion.md is missing"
    }
}

$allActiveTextRaw = ((Get-ActiveTextFiles | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw -ErrorAction SilentlyContinue }) -join "`n")
if ($allActiveTextRaw -match '\badd_trait\s*=') {
    if (Test-Path -LiteralPath (Join-Path $Root 'common/traits')) {
        Add-Pass 'common/traits exists because traits are referenced'
    } else {
        Add-Fail 'traits are referenced but common/traits is missing'
    }
}
if ($allActiveTextRaw -match '\badd_character_modifier\s*=|\bhas_character_modifier\s*=') {
    if (Test-Path -LiteralPath (Join-Path $Root 'common/modifiers')) {
        Add-Pass 'common/modifiers exists because modifiers are referenced'
    } else {
        Add-Fail 'modifiers are referenced but common/modifiers is missing'
    }
}

foreach ($danger in @('map_data', 'definition.csv', 'indirection_heightmap.png', 'provinces.png', 'bookmark_jdtc', 'unify_region_decision', 'common/bookmarks', 'common/landed_titles', 'history/provinces', 'history/titles')) {
    $hits = Find-ActivePattern $danger
    if ($hits.Count -gt 0) {
        Add-Fail ("active file references {0}: {1}" -f $danger, (($hits | Select-Object -First 8) -join ', '))
    } else {
        Add-Pass "no active file references $danger"
    }
}

foreach ($pattern in @('h_china', 'k_chrysanthemum_throne', 'k_silla', 'k_viet', 'e_song', 'k_song', 'd_song', 'every_living_character', 'every_character', 'yearly_global_pulse', 'title:', 'has_title', 'title_exists', 'root.liege.primary_title', 'any_de_jure_top_liege_title')) {
    $hits = Find-ActivePattern $pattern
    if ($hits.Count -gt 0) {
        Add-Warn ("{0} reference(s) to {1}: {2}" -f $hits.Count, $pattern, (($hits | Select-Object -First 8) -join ', '))
    }
}

$customTitleHits = Find-ActivePattern '\b[e_k_d_c_b]_jdtc_[A-Za-z0-9_]+' -Regex
if ($customTitleHits.Count -gt 0) {
    Add-Warn ("{0} custom JDTC title reference(s): {1}" -f $customTitleHits.Count, (($customTitleHits | Select-Object -First 8) -join ', '))
}

$locFiles = Get-ActiveGameText 'localization'
$locRaw = (($locFiles | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw -ErrorAction SilentlyContinue }) -join "`n")
$possibleMissingLoc = New-Object System.Collections.Generic.List[string]
foreach ($file in Get-ActiveGameText 'common/decisions') {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($m in [regex]::Matches($text, '(?m)^([a-z0-9_]+_decision)\s*=')) {
        $key = $m.Groups[1].Value
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key))\s*:") { $possibleMissingLoc.Add($key) | Out-Null }
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key + '_desc'))\s*:") { $possibleMissingLoc.Add($key + '_desc') | Out-Null }
    }
}
foreach ($file in Get-ActiveGameText 'events') {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($m in [regex]::Matches($text, '(?m)^(jdtc_[a-z0-9_]+\.\d+)\s*=')) {
        $key = $m.Groups[1].Value
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key + '.t'))\s*:") { $possibleMissingLoc.Add($key + '.t') | Out-Null }
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key + '.desc'))\s*:") { $possibleMissingLoc.Add($key + '.desc') | Out-Null }
    }
}
foreach ($file in Get-ActiveGameText 'common/modifiers') {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($m in [regex]::Matches($text, '(?m)^([a-z0-9_]+)\s*=\s*\{')) {
        $key = $m.Groups[1].Value
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key))\s*:") { $possibleMissingLoc.Add($key) | Out-Null }
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key + '_desc'))\s*:") { $possibleMissingLoc.Add($key + '_desc') | Out-Null }
    }
}
foreach ($file in Get-ActiveGameText 'common/traits') {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($m in [regex]::Matches($text, '(?m)^([a-z0-9_]+)\s*=\s*\{')) {
        $key = 'trait_' + $m.Groups[1].Value
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key))\s*:") { $possibleMissingLoc.Add($key) | Out-Null }
        if ($locRaw -notmatch "(?m)^\s*$([regex]::Escape($key + '_desc'))\s*:") { $possibleMissingLoc.Add($key + '_desc') | Out-Null }
    }
}
if ($possibleMissingLoc.Count -gt 0) {
    $uniqueLoc = $possibleMissingLoc | Sort-Object -Unique | Select-Object -First 20
    Add-Warn ("possible missing localization key(s): {0}" -f ($uniqueLoc -join ', '))
} else {
    Add-Pass 'basic localization coverage check passed'
}

Write-Host '=== Jianghu Dynasty validation ==='
Write-Host ''
Write-Host ("PASS ({0})" -f $pass.Count)
$pass | ForEach-Object { Write-Host "  PASS: $_" }
Write-Host ''
Write-Host ("WARN ({0})" -f $warn.Count)
if ($warn.Count -eq 0) { Write-Host '  none' } else { $warn | ForEach-Object { Write-Host "  WARN: $_" } }
Write-Host ''
Write-Host ("FAIL ({0})" -f $fail.Count)
if ($fail.Count -eq 0) { Write-Host '  none' } else { $fail | ForEach-Object { Write-Host "  FAIL: $_" } }
Write-Host ''

if ($fail.Count -eq 0) {
    Write-Host 'Recommended next action: clear CK3 cache/shadercache, enable only Jianghu Dynasty, start a new vanilla-map game, then inspect error.log.'
    exit 0
}

Write-Host 'Recommended next action: fix FAIL items before launching CK3.'
exit 1
