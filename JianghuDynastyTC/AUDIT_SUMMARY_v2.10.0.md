# Jianghu Dynasty v2.10.0 Repository Audit Summary

## Repository State Before Expansion

- `descriptor.mod` existed and used the vanilla-map stable branch.
- Launcher file `../JianghuDynastyTC.mod` existed but needed the current version line restored.
- Active gameplay files were limited to `common/decisions`, `common/modifiers`, `events`, `localization`, and `tools`.
- No active `map_data`, `common/bookmarks`, `common/landed_titles`, `history/provinces`, or `history/titles` folders were present.
- `_disabled_total_conversion_map/` preserved the old custom map, bookmark, title, history, generated overrides, and legacy review content.
- `_tc_staging/` and `_tc_activation_ready/` remain staging archives and are excluded from active validation.

## Active Feature Summary

- v2.4.0 technical base was stable and validator-clean.
- Existing active gameplay covered Jianghu reputation, martial practice, military service, court service, mentor/disciple flavor, rivalry/honor flavor, and small decision-triggered events.
- v2.10.0 adds schools, sects, power struggles, Wulin gatherings, tournaments, secret manuals, legendary arts, frontier patriotism, and court-Jianghu tension.

## Dangerous Reference Report

Active files were searched for map/title/bookmark hazards including `replace_path`, `map_data`, `definition.csv`, `provinces.png`, `indirection_heightmap`, `bookmark_jdtc`, custom Song title IDs, broad title checks, and heavy global pulses.

Result: no active fatal custom map/title/bookmark dependency was retained.

## Immediate Fixes Completed

- Restored launcher `.mod` version metadata.
- Updated stable version to `2.10.0`.
- Added validator checks for current changelog, documentation, history folders, referenced traits/modifiers, heavy scans, and basic localization coverage.
