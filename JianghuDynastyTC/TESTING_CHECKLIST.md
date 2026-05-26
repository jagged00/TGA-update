# Jianghu Dynasty v2.15.0 Testing Checklist

## Required Manual Tests

1. Launch CK3 with only Jianghu Dynasty enabled.
2. Confirm main menu loads.
3. Start a new game on the vanilla map.
4. Confirm no immediate crash.
5. Open decisions.
6. Test Jianghu reputation decisions.
7. Test martial school decisions.
8. Test sect decisions.
9. Test mentor-disciple decisions.
10. Test duel/rivalry and honor events.
11. Test power struggle decisions.
12. Test Wulin gathering and tournament decisions.
13. Test secret manual and legendary art decisions.
14. Test frontier, court, and patriotism decisions.
15. Test final sandbox cadence decision.
16. Save game.
17. Load game.
18. Check `error.log`.
19. Confirm no active `map_data` errors.
20. Confirm no active bookmark/title-history/province-history errors from this mod.
21. Confirm no dangerous `replace_path`.

## Repository Checks

- Run `tools/validate_jdtc_mod.ps1`.
- Confirm descriptor and launcher both show version 2.15.0.
- Confirm no active `map_data`.
- Confirm no active `common/bookmarks`.
- Confirm no active `common/landed_titles`.
- Confirm no active `history/provinces`.
- Confirm no active `history/titles`.
