# Jianghu Dynasty: Free Life Martial & Military Sandbox

Version: 2.15.0 Final Vanilla Map Edition  
CK3 compatibility: 1.19.*  
Map mode: vanilla CK3 map

Jianghu Dynasty is a vanilla-map Song-era wuxia gameplay overhaul for Crusader Kings III. The v2.x line is now considered feature-complete as a stable vanilla-map edition.

## Final Vanilla Map Scope

- Jianghu and Wulin reputation.
- Original martial schools and sects.
- School ranks, sect influence, master-disciple flavor, and honor disputes.
- Jianghu social web: sworn bonds, rivalry memory, betrayal rumors, reconciliation, and debts of honor.
- Wulin gatherings, tournaments, public mediation, and martial crisis flavor.
- Secret manuals, legendary arts, forbidden techniques, and inheritance risk.
- Frontier patriotism, military service, court-Jianghu tension, and public service.
- Final balance and cadence decisions for long-running sandbox play.

## Stability Rules

- Vanilla CK3 map only.
- No active custom `map_data`.
- No active custom bookmarks.
- No total conversion landed title replacement.
- No province or title history replacement.
- No dangerous `replace_path`.
- No level system.
- No XP system.
- No mandatory quest chain.
- No fixed ending.
- No class lock.

## Disabled Total Conversion Work

The old Song total conversion map remains archived in `_disabled_total_conversion_map/`. It is reference material only. Future map work belongs in a separate v3.0.0 experimental branch or workspace.

## Validation

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\validate_jdtc_mod.ps1
```

Then clear CK3 cache and shadercache, enable only Jianghu Dynasty, start a new vanilla-map game, test decisions, save, load, and inspect `error.log`.
