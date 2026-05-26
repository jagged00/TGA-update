# Jianghu Dynasty v2.4.0 Final Validation Report

## 1. Current Version Completed

v2.4.0 stable vanilla-map release.

## 2. Files Changed or Added

- `descriptor.mod`
- `../JianghuDynastyTC.mod`
- `common/decisions/jdtc_jianghu_decisions.txt`
- `common/modifiers/jdtc_jianghu_modifiers.txt`
- `events/jdtc_jianghu_events.txt`
- `localization/english/jdtc_jianghu_l_english.yml`
- `tools/validate_jdtc_mod.ps1`
- `tools/clear_ck3_cache_instructions.txt`
- `README.md`
- `CHANGELOG.md`
- `CHANGELOG_v2.2.7.md`
- `CHANGELOG_v2.2.8.md`
- `CHANGELOG_v2.2.9.md`
- `CHANGELOG_v2.3.0.md`
- `CHANGELOG_v2.3.1.md`
- `CHANGELOG_v2.4.0.md`
- `AUDIT_SUMMARY_v2.4.0.md`
- `PARADOX_MODS_DESCRIPTION.md`
- `TESTING_CHECKLIST.md`
- `KNOWN_ISSUES.md`
- `FINAL_VALIDATION_REPORT_v2.4.0.md`

## 3. Folders Disabled

- `map_data` -> `_disabled_total_conversion_map/map_data`
- `history/provinces` -> `_disabled_total_conversion_map/history_provinces`
- `history/titles` -> `_disabled_total_conversion_map/history_titles`
- `history/characters` -> `_disabled_total_conversion_map/legacy_tc_review_content/history_characters`
- `common/landed_titles` -> `_disabled_total_conversion_map/landed_titles`
- `common/bookmarks` -> `_disabled_total_conversion_map/bookmarks`
- Legacy events/localization/common overrides -> `_disabled_total_conversion_map/legacy_tc_review_content/`
- Generated sanitized vanilla overrides -> `_disabled_total_conversion_map/sanitized_vanilla_overrides/`
- Legacy root reports and plans -> `_disabled_total_conversion_map/legacy_tc_review_content/root_reports/`

## 4. Dangerous replace_path Entries Removed

Both `descriptor.mod` and the launcher `.mod` file now contain no `replace_path` entries.

## 5. Gameplay Systems Preserved

- Jianghu martial roleplay identity.
- Military/court service theme.
- Optional sandbox direction without mandatory chains.

## 6. Gameplay Systems Added

- Jianghu reputation modifiers.
- Martial path decisions.
- Military path decisions.
- Court-service decisions.
- Career flavor for wanderer, soldier, officer, general, strategist, mentor/disciple, rival, and honor play.
- Small decision-triggered event pool.

## 7. Remaining Warnings

The automated validator reports zero warnings for active game files.

## 8. Remaining Risks

- Manual CK3 launch/new-game/save/load testing is still required.
- Old saves from the previous TC-map attempts may remain incompatible or slow.
- The v3 Song map rebuild is documentation-only and must not be merged into stable.

## 9. Testing Instructions

Run `tools/validate_jdtc_mod.ps1`, clear CK3 cache and shadercache, enable only Jianghu Dynasty, start a new vanilla-map game, test decisions, save, reload, and inspect `error.log`.

## 10. Main Menu Expectation

CK3 should now reach the main menu because active custom map, bookmark, landed title, province history, title history, and dangerous `replace_path` content are disabled.

## 11. New Game Expectation

A new vanilla-map game should work and show optional Jianghu decisions for adult playable characters.

## 12. Recommended Next Version

v2.4.1 should be a manual QA and error-log cleanup patch after real CK3 testing.

## 13. Files Requiring Manual Review

- `error.log` after first launch.
- `error.log` after starting a new game.
- Any save/load logs from the first v2.4.0 validation save.
