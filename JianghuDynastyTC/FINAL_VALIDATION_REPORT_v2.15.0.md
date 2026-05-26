# Jianghu Dynasty v2.15.0 Final Validation Report

## Highest Completed Version

v2.15.0 Final Vanilla Map Edition.

## v2.4.0 Base Status

The stable base was already validator-clean. v2.15.0 builds on the v2.10.0 stable Wuxia expansion and completes the planned vanilla-map content line.

## Files Changed

- `descriptor.mod`
- `../JianghuDynastyTC.mod`
- `tools/validate_jdtc_mod.ps1`
- `README.md`
- `CHANGELOG.md`
- `PARADOX_MODS_DESCRIPTION.md`
- `TESTING_CHECKLIST.md`
- `KNOWN_ISSUES.md`
- `ROADMAP_AFTER_v2.10.0.md`
- `CREDITS_AND_DESIGN_NOTES.md`

## Files Created

- `common/decisions/jdtc_final_vanilla_decisions.txt`
- `common/modifiers/jdtc_final_vanilla_modifiers.txt`
- `events/jdtc_final_vanilla_events.txt`
- `localization/english/jdtc_final_vanilla_l_english.yml`
- `CHANGELOG_v2.11.0.md`
- `CHANGELOG_v2.12.0.md`
- `CHANGELOG_v2.13.0.md`
- `CHANGELOG_v2.14.0.md`
- `CHANGELOG_v2.15.0.md`
- `FULL_CHANGELOG_v2.4.0_to_v2.15.0.md`
- `AUDIT_SUMMARY_v2.15.0.md`
- `FINAL_VALIDATION_REPORT_v2.15.0.md`

## Folders Disabled

No new folders were disabled. Existing disabled total conversion work remains archived in `_disabled_total_conversion_map/`.

## Dangerous References Removed

No active dangerous references were found in the final pass. The validator version check was tightened so `supported_version` cannot satisfy launcher `version`.

## v2.11.0 Features

School council, rule clarification, cross-school exchange, sect relief, oath keeping, and archive guarding.

## v2.12.0 Features

Sworn bonds, old grievances, betrayal rumors, reputation repair, and debts of honor.

## v2.13.0 Features

Frontier command council, logistics reform, court-Jianghu envoy, border rescue, and commander rivalry.

## v2.14.0 Features

Manual commentary, forbidden art restraint, technique lineage clarification, and complete manual cycle.

## v2.15.0 Polish

Final version metadata, documentation, frozen v2.x feature scope, validator hardening, and final sandbox cadence content.

## Validator Result

PASS: 31  
WARN: 0  
FAIL: 0

Additional static checks passed:

- Brace balance check.
- Dangerous reference search.
- Decision illustration references against vanilla assets.
- Duplicate localization key check.
- Event option and decision helper localization check.
- Modifier, trait, scripted effect, and scripted trigger reference checks.

## Remaining Risks

- Manual CK3 testing is still required.
- Runtime parser warnings can only be confirmed inside CK3.
- Old total conversion saves may be incompatible.

## Manual Testing Steps

Run the checklist in `TESTING_CHECKLIST.md`: clear cache/shadercache, enable only Jianghu Dynasty, confirm main menu, start a new vanilla-map game, test decisions, save/load, and inspect `error.log`.

## Recommended Next Branch

v3.0.0 Song Map Experimental, separate branch/workspace only.
