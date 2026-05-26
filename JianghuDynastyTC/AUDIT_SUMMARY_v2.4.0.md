# Jianghu Dynasty v2.4.0 Stability Audit Summary

## Initial Critical Findings

- Active total conversion folders were present: `map_data`, `common/landed_titles`, `common/bookmarks`, `history/provinces`, and `history/titles`.
- The custom map pipeline was unsafe for CK3 loading. `definition.csv` used UTF-8 BOM encoding, and key PNG map files were reported as unreadable or BOM-corrupted.
- Descriptor files contained broad `replace_path` entries that replaced vanilla map, bookmark, landed title, history, and other systems.
- Active bookmarks, title history, province history, and generated vanilla overrides referenced custom JDTC/Song title structures.
- The folder was not a git repository, so the v3 Song map rebuild target is documented as a sibling workspace rather than an actual branch.

## Stable v2.4.0 State

- The active mod no longer contains `map_data`, `common/bookmarks`, `common/landed_titles`, `history/provinces`, or `history/titles`.
- Dangerous total conversion and generated override content is preserved under `_disabled_total_conversion_map/`.
- `descriptor.mod` and the launcher `.mod` file contain no `replace_path` entries.
- The active gameplay surface is limited to additive vanilla-map decisions, modifiers, events, localization, and validation tools.
- The stable branch remains compatible with CK3 `1.19.*`.
