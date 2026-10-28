# TMF — Too Many Features

53 toggleable quality-of-life features, a player settings menu, and an admin panel.
Data pack format **121** (Minecraft Java Edition 26.3).

## Install

1. Copy the whole TMF folder (the one containing `pack.mcmeta`) into `<world>/datapacks/`.
2. **Restart the world or server** (single-player: Save and Quit to Title, then open the world again).
   A plain `/reload` isn't enough the first time. TMF adds a custom enchantment (used by Pet Protection), and the game only loads enchantments when the world opens.
3. As an operator, run `/function tmf:admin` once. This makes you an TMF admin and opens the admin panel.

Players open their own settings with **`/trigger tmf`**, sorted into the same categories as the admin panel. Tool Protector, Tool Auto-Swap, the Coordinates HUD, Faster Paths, Fence Jumping and Biome Change Info start switched off for each player, who can switch them on there (features the server has switched off are hidden there) and their stats with **`/trigger tmf.stats`**.
Admins can reopen the admin panel with `/trigger tmf set 2`, or with the ⚙ button in the player menu.

## Features

| # | Feature | How it works | On by default | Players can opt out |
|---|---------|--------------|---------------|---------------------|
| 1 | Tool Protector | When your held tool reaches 2 durability, an identical spare tool from your inventory is swapped into your hand. If there is no spare, you get a warning before it breaks. | – | opt-in |
| 2 | Shulker Preview | Sneak while holding a shulker box: its contents appear in chat, grouped by item. Hover over an item to see its tooltip. | ✔ | ✔ |
| 3 | Death-Drop Glow | When you die, your dropped items glow and last 10 minutes instead of 5. You get the coordinates, and you can click them to copy. | ✔ | – |
| 4 | Faster Paths | +30 % walking speed on dirt paths. | ✔ | opt-in |
| 5 | Horse Stats | Sneak + right-click a horse, donkey, mule, llama or camel to see its speed, jump height, health and owner. | ✔ | ✔ |
| 6 | Pet Protection | Tamed pets are immune to damage from their owner. The admin panel can change this to *all players*. | ✔ | – |
| 7 | No Phantoms | Sets the game rule `spawn_phantoms` to false. The original value comes back when you turn this off. | – | – |
| 8 | Enderman Anti-Grief | Endermen can no longer pick up blocks. Other mob griefing is unaffected. | – | – |
| 9 | Silence Mobs | Use a name tag to name a mob `Silence`, `Quiet`, `Shh` or `Silent` and it goes silent. Renaming it brings the sound back. | ✔ | – |
| 10 | Pet Teleport | Wolves, cats and parrots that are following you (not sitting, not leashed) come with you through portals. | ✔ | ✔ |
| 11 | Ladder Dropping | Hold a ladder and right-click an existing ladder: a new ladder goes at the bottom of that ladder column, even where there's no wall behind it, so you can drop ladders down open shafts. Left-click breaks the ladder. Sneak to place ladders normally. | ✔ | ✔ |
| 12 | Double Doors | Opening or closing one door of a pair also opens or closes the other. Sneak to use only one door. | ✔ | ✔ |
| 13 | Cauldron Trash | Items thrown into a lava cauldron are destroyed, including netherite. | – | – |
| 14 | Health Bars | Mobs you hit show a health bar and their HP for 3 seconds. Mobs with a real name are never renamed. | ✔ | – |
| 15 | Damage Numbers | A floating number shows the damage each hit dealt (☠ on killing blows). | ✔ | – |
| 16 | AFK Detection | Players idle for 5 minutes (configurable) get an `[AFK]` grey name and an announcement. AFK players don't count toward night skipping. | – | – |
| 17 | Stats Card | `/trigger tmf.stats` shows playtime, deaths, kills, distance, damage, fish, trades and more. There is a *Share* button too. | ✔ | – |
| 18 | Join & Leave Messages | Welcome message, a first-join announcement, and each player's session length when they leave. | – | – |
| 19 | Right-Click Harvest | Right-click a fully grown crop (wheat, carrots, potatoes, beetroot, nether wart, cocoa) to harvest and replant it. Drops are normal, Fortune works, and one seed is used for the replant. Sneak for vanilla behaviour. | – | ✔ |
| 20 | Invisible Item Frames | Right-click an item frame or glow item frame with shears to make it invisible, or visible again. Your shears stay in your hand and the item inside isn't rotated. | ✔ | ✔ |
| 21 | No Crop Trampling | Jumping or falling onto farmland no longer turns it into dirt (for players). | – | – |
| 22 | Fast Leaf Decay | When you chop a tree, the leaves left floating disappear within about a second, with normal sapling, stick and apple drops. | – | – |
| 23 | Armor Warning | A sound plus a chat and actionbar warning when a worn armor piece or elytra has 20 or less durability left. It repeats at most every 30 s for each slot. | ✔ | ✔ |
| 24 | Tool Auto-Swap | When you start breaking a block (first left-click) while holding a tool or sword, the best tool in your inventory for that block is swapped in (pickaxe, axe, shovel, hoe or shears; the highest material wins). While you keep mining, for example when tunnelling, it swaps as soon as you look at a block that needs a different tool, up to your full reach. Chests, doors, crafting tables and other blocks you right-click are ignored. It pauses for 3 s after combat. Sneak to stop it. | – | opt-in |
| 25 | Coordinates HUD | Your XYZ coordinates and facing direction in a small bar at the top of the screen, in light grey. **Opt-in** per player. | – | opt-in |
| 26 | Spawn-Proof Checker | Sneak while holding a torch to see a small flame on each block within 6 blocks where monsters can spawn (light level 0). | – | ✔ |
| 27 | Veinminer | Mine an ore with a pickaxe while sneaking (or always, see below): the whole connected vein (up to 64 blocks, deepslate variants included) is mined. Each block costs 1 durability and it stops before the tool breaks. Fortune and Silk Touch apply, and XP drops as normal. Each player chooses **Off**, **Sneaking** (default) or **Always** in `/trigger tmf`. | – | mode |
| 28 | Tree Feller | Chop a log with an axe while sneaking (or always, see below): every connected log of the same wood type is chopped (up to 200, diagonal branches included). It only works on real trees: the trunk has to end in natural leaves. Each log costs 1 durability. With Fast Leaf Decay on, the leaves disappear as well. Also works on nether stems. Each player chooses **Off**, **Sneaking** (default) or **Always**. | – | mode |
| 29 | Fence Jumping | When you stand against a fence, wall or closed fence gate, your jump gets a little higher so you can hop onto it and over. | ✔ | opt-in |
| 30 | Wandering Trader Alert | When a wandering trader spawns within 200 blocks you get a chat message with its rough distance and direction, e.g. *about 54 blocks northeast*. | ✔ | opt-in |
| 31 | Sort Chest | Sneak and right-click a chest, trapped chest or barrel with empty hands. Its contents are stacked together and sorted by item name; double chests are sorted as one. | ✔ | opt-in |
| 32 | Pickup Notices | A short note above the hotbar shows what you just got, e.g. *+12 Cobblestone +1 Diamond*. | ✔ | ✔ |
| 33 | Item Magnet | Dropped items and XP orbs within 7 blocks fly to you. Sneak to pause it. Items you throw yourself are ignored. | – | opt-in |
| 34 | Breeding Info | Hold an animal's food and look at it to see whether it's ready to breed, how long its breeding cooldown lasts, or when a baby grows up. | ✔ | ✔ |
| 35 | Sapling Replant | Saplings (and azaleas and mangrove propagules) lying on dirt, grass or moss for 30 seconds plant themselves. | – | – |
| 36 | Copper Oxidation Info | Sneak and look at any copper block to see its oxidation stage (unaffected, exposed, weathered or oxidized) and whether it's waxed. | ✔ | ✔ |
| 37 | Playtime Milestones | A server-wide announcement when a player reaches 1, 5, 10, 25, 50, 100, 250, 500 or 1000 hours played. | ✔ | – |
| 38 | Day Counter | At the start of every in-game day, *Day N* appears above the hotbar. | ✔ | ✔ |
| 39 | Creeper No-Grief | Creeper explosions don't break blocks or item frames. Players and mobs nearby still take explosion damage (charged creepers hit twice as far). | – | – |
| 40 | Ghast No-Grief | Ghast fireballs don't break blocks or start fires. A direct hit and the blast still hurt, and you can still send fireballs back. | – | – |
| 41 | No Zombie Door Breaking | Zombies, husks and zombie villagers can no longer break wooden doors on Hard difficulty. | – | – |
| 42 | Pet Health | Sneak and look at a tamed animal to see its health, e.g. *Wolf ❤ 17.5 / 20*. | ✔ | ✔ |
| 43 | Animal Owners | Sneak and look at a tamed animal to see who owns it, even when the owner is offline. | ✔ | ✔ |
| 44 | Crop Growth Info | Sneak and look at a crop, stem, sweet berry bush, cave vine or sapling to see its growth in percent and stages, and whether its farmland is dry. | ✔ | ✔ |
| 45 | Biome Change Info | *Entering Cherry Grove* appears above the hotbar when you walk into a different biome. | ✔ | opt-in |
| 46 | Campfire Timer | Sneak and look at a campfire: each item on it is listed with the time it still needs. | ✔ | ✔ |
| 47 | Furnace Progress | Sneak and look at a furnace, smoker or blast furnace: what it's smelting, the progress, the time left for this item and the whole stack, the fuel left and what's in the output slot. | ✔ | ✔ |
| 48 | Slime Chunk Checker | Hold a slimeball (either hand) to see whether you're standing in a slime chunk. An admin has to enter the world seed once (admin panel → *Slime chunk seed*); TMF checks it against the world. | – | ✔ |
| 49 | Arrow Counter | Hold a bow or crossbow to see how many normal, spectral and tipped arrows you carry, and whether your bow has Infinity. | ✔ | ✔ |
| 50 | Compass Coordinates | Hold a lodestone compass to see its lodestone's coordinates and distance. A recovery compass shows where you last died. | – | ✔ |
| 51 | Waypoints | *📍 Waypoints…* in `/trigger tmf`: save up to 3 places (named Home, Base, Farm, Mine, Portal, …), then pick one to be guided there. The bar at the top of the screen shows an arrow, the distance and the height difference. You can also be guided to your last death point. | – | ✔ |
| 52 | Entity Crowd Warning | Every 30 seconds TMF counts the entities in the chunks around each player. Admins get a chat warning (with a teleport button) when a chunk has more than the limit (default 200), at most every 5 minutes per chunk. | ✔ | – |
| 53 | Campfire Regen | Every 5 seconds, players within 4 blocks of a lit campfire (or soul campfire) who aren't at full health get Regeneration II for 3 seconds, which heals about one heart. A message tells you when you step into a campfire's warmth. | ✔ | – |

## Admin panel

* A switch for each of the 53 features, saved per world, grouped into nine categories (Mining & tools, Farming & building, Inventory, Pets & mobs, Mob griefing, Combat, Info & HUD, Movement, Multiplayer); each category button shows how many of its features are on. The Mob griefing page also has a switch for the vanilla `mob_griefing` game rule. A fresh install turns on the features marked *On by default*.
* **Presets:** Everything on · Recommended (the default selection) · Minimal (info features only) · All off.
* **Player locks:** force a personal feature on for everyone, so players can't turn it off.
* **Performance mode:** pauses health bars and damage numbers, and runs the enderman and cauldron scans 4× less often.
* **Settings:** AFK timeout (2–30 min), the base percentage of players needed to sleep, and the Entity Crowd Warning limit (100–500).
* **Player inspector:** pick any player who has joined since v1.11 to see whether they're online, their position, health, food, level, game mode, AFK state, playtime, deaths and kills. For offline players it shows their last known position and how long ago they left. A button teleports you there.
* **Lag helper:** counts loaded entities by kind (items, XP orbs, arrows, hostile mobs, animals, villagers, …) and how many are near each player, with buttons to clear old dropped items (2+ minutes, death drops are kept), XP orbs, arrows stuck in blocks, or hostile mobs that aren't name-tagged.
* **Slime chunk seed:** paste the number from `/seed` once so the Slime Chunk Checker works.
* **Changelog** and a full **Uninstall**, which removes all scoreboards, tags and helper entities and restores the game rules it changed.

## Notes & limitations

* Stats Card numbers are counted from when TMF was added to the world, because datapacks can't read stats from before that.
* Pet Protection works with an invisible, enchanted barrier item in the pet's (unused) feet slot. The item never drops. The pet is protected within a second of being tamed.
* Enderman Anti-Grief gives endermen an invisible "structure void" to hold, so they can't pick up anything else. If one ever puts it down, TMF removes it straight away.
* Ladder Dropping, Right-Click Harvest and Tool Auto-Swap place an invisible click-catcher over the ladder, ripe crop or block you look at (within 3 blocks). Because of this, you can't eat or block with a shield while looking at a ripe crop up close. Sneak for vanilla behaviour.
* The Spawn-Proof Checker uses the game's combined light value. It is exact in caves and indoors. Outdoors at night, the moonlight keeps the value above 0, so unlit outdoor spots are not flagged.
* No Crop Trampling gives a falling player a one-tick slow-falling effect just above farmland, so landing there also causes no fall damage. Mobs can still trample farmland unless `mob_griefing` is off.
* Pickup Notices compare your inventory before and after each change, so items taken from chests or crafted also show up. Only gains are shown, up to 4 item types at once.
* Sort Chest sorts alphabetically by item ID and merges stacks up to each item's stack size. Items with different enchantments or names are never merged.
* Wandering Trader Alert shows the trader's position at the moment it spawned.
* Item Magnet moves items in a straight line toward you, so it can pull them through walls.
* Day Counter follows the Overworld day cycle, including nights skipped by sleeping.
* Playtime Milestones are based on the Stats Card playtime, so they count from when TMF was added.
* Veinminer and Tree Feller cost exactly 1 durability per block (Unbreaking isn't applied to the extra blocks). They don't run in creative mode. Tree Feller only fells real trees: it climbs the trunk and needs natural leaves (or nether wart blocks / shroomlights) within 3 blocks of its top. Leaves placed by players never count, so log buildings are safe. While felling it stays within 7 blocks sideways of the chopped log and never goes below it.
* Floating ladders placed by Ladder Dropping stay up until a block next to them changes, like any ladder without support.
* Tool Auto-Swap starts with your first left-click on a block within 3 blocks that a different tool type in your inventory mines better. After that it stays active for 5 s after every mined block, so tunnelling swaps instantly. Containers, doors, crafting stations and other interactive blocks are ignored, and so are tilling with a hoe, scraping copper with an axe and putting out campfires with a shovel. If you right-click such a block before you've started mining (for example to place an offhand torch), the first click is skipped and Tool Auto-Swap steps aside for 2 seconds; just click again. It never replaces a tool of the right type you're already holding, for example a silk-touch pickaxe.
* With AFK Detection on, TMF manages the game rule `players_sleeping_percentage`. Set the base value in the admin panel, not with `/gamerule`.
* The AFK grey name uses a team and only applies to players who aren't already on another team.
* Creeper No-Grief and Ghast No-Grief set the explosion size to 0 and apply the damage themselves, using vanilla's distance falloff (difficulty and Blast Protection apply). Walls don't shield you from this damage, and there is no knockback. A creeper killed before it explodes does nothing. Both also leave dropped items, armor stands, item frames and paintings alone.
* No Zombie Door Breaking doesn't stop vindicators breaking doors during raids.
* Crop, campfire, furnace and copper info, pet health and owners show while you sneak and look at the block or animal (within 5 blocks for blocks, 8 for animals). Animal Owners knows the names of players who have joined since TMF v1.11.
* The coordinates and waypoint bar is a boss bar that only you can see. Like any boss bar it shows an empty bar under the text.
* Waypoint names are picked from a list (Home, Base, Farm, …) because datapacks can't receive typed text from players without operator rights.
* The Slime Chunk Checker uses the same formula as the game. The world seed has to be typed in once: `/seed` only gives datapacks the lower 32 bits of the seed, and the slime chunk formula needs 48. TMF checks the part it can read before saving.
* Biome Change Info waits until you've been in a new biome for 2 seconds, so walking along a border doesn't spam you.
* The Entity Crowd Warning counts everything except players: mobs, items, XP orbs, item frames, armor stands and so on.

## Trigger reference

| Command | Who | Action |
|---|---|---|
| `/trigger tmf` | everyone | open the personal settings menu |
| `/trigger tmf set 3` | everyone | list the server's enabled features |
| `/trigger tmf.stats` | everyone | show your stats card |
| `/function tmf:admin` | operators | become an TMF admin and open the admin panel |
| `/trigger tmf set 2` | TMF admins | open the admin panel |
| `/trigger tmf set 4000` | everyone | open your waypoints |

## Editing

The datapack is generated by `tools/gen.py` (Python 3.12+). To change a feature, edit the generator and run `python tools/gen.py`. It rewrites `data/` and `pack.mcmeta` in this folder. The `tools/` folder is ignored by Minecraft.
