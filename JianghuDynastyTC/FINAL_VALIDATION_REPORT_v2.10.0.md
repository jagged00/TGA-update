# Jianghu Dynasty v2.10.0 Final Validation Report

## Highest Completed Version

v2.10.0 stable vanilla-map Song-era wuxia expansion.

## v2.4.0 Base Status

The v2.4.0 base was technically stable and validator-clean. The new v2.10.0 work expanded the expected school, sect, power struggle, Wulin, manual, and frontier systems without re-enabling any total conversion map content.

## Files Changed

- `descriptor.mod`
- `../JianghuDynastyTC.mod`
- `tools/validate_jdtc_mod.ps1`
- `README.md`
- `CHANGELOG.md`
- `PARADOX_MODS_DESCRIPTION.md`
- `TESTING_CHECKLIST.md`
- `KNOWN_ISSUES.md`

## Files Created

- `common/decisions/jdtc_wuxia_expansion_decisions.txt`
- `common/modifiers/jdtc_wuxia_expansion_modifiers.txt`
- `common/scripted_effects/jdtc_wuxia_scripted_effects.txt`
- `common/scripted_triggers/jdtc_wuxia_scripted_triggers.txt`
- `common/traits/jdtc_wuxia_traits.txt`
- `events/jdtc_wuxia_expansion_events.txt`
- `localization/english/jdtc_wuxia_expansion_l_english.yml`
- `AUDIT_SUMMARY_v2.10.0.md`
- `CHANGELOG_v2.5.0.md`
- `CHANGELOG_v2.6.0.md`
- `CHANGELOG_v2.7.0.md`
- `CHANGELOG_v2.8.0.md`
- `CHANGELOG_v2.9.0.md`
- `CHANGELOG_v2.10.0.md`
- `FULL_CHANGELOG_v2.4.0_to_v2.10.0.md`
- `ROADMAP_AFTER_v2.10.0.md`
- `CREDITS_AND_DESIGN_NOTES.md`
- `ROADMAP_v3.0.0_SONG_MAP_EXPERIMENTAL.md`

## Folders Disabled

No new folders had to be disabled in this pass. Existing disabled total conversion content remains in `_disabled_total_conversion_map/`.

## Dangerous References Removed

No active dangerous references were found in the final validation pass. The stable branch has no active custom map, bookmark, title history, province history, landed title replacement, or dangerous `replace_path`.

## v2.5.0 Features

Great schools, sects, school ranks, sect ranks, school decisions, sect decisions, school events, and sect events.

## v2.6.0 Features

School, sect, court, and military power struggle decisions and event outcomes.

## v2.7.0 Features

Wulin gatherings, public mediation, traitor accusations, alliance support, public recognition, tournament events, and martial crisis responses.

## v2.8.0 Features

Secret manuals, external/internal/movement/special/forbidden arts, inheritance, damaged scripture, manual guarding, recovery, destruction, hiding, and risk tradeoffs.

## v2.9.0 Features

Frontier defense, militia training, border commander advice, supply escort, refugee protection, bandit hunting, martial hero rallying, and court-Jianghu moral tension.

## v2.10.0 Polish

Version metadata, validator expansion, documentation, full changelog, roadmap, Paradox Mods description, testing checklist, design notes, and v3.0.0 experimental roadmap notes.

## Validator Result

PASS: 31  
WARN: 0  
FAIL: 0

## Remaining Warnings

None from the validator.

## Remaining Risks

- Manual CK3 testing is still required.
- CK3 may still report non-fatal balance or parser warnings that only appear at runtime.
- Old total conversion saves may not be compatible with the stable vanilla-map branch.

## Manual Testing Steps

Follow `TESTING_CHECKLIST.md`: clear cache/shadercache, enable only Jianghu Dynasty, confirm main menu, start a new vanilla-map game, test decisions, save, load, and inspect `error.log`.

## Expected Runtime Result

CK3 should reach the main menu. A new vanilla-map game should work. Save/load should work for new v2.10.0 saves if no runtime-only CK3 parser issue appears.

## Recommended Next Branch

v3.0.0 Song Map Experimental, separate branch/workspace only. Do not merge v3 map work into v2.x stable.
