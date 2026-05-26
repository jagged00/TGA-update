# v3.0.0 Song Map Experimental Roadmap

v3.0.0 must be a separate experimental branch or workspace. Do not merge map work into the v2.x stable branch.

Future v3 map work must rebuild and validate:

- `provinces.png`
- `definition.csv`
- heightmap assets
- indirection map assets
- `default.map`
- geographical regions
- landed titles
- province history
- title history
- bookmarks

Testing requirements:

- Test the custom map in isolation.
- Confirm the main menu loads.
- Confirm a new game starts.
- Confirm save and load work.
- Confirm no fatal province image, definition encoding, indirection map, bookmark, landed title, or title history errors.

Until that isolated validation exists, the stable v2.x branch remains vanilla-map only.
