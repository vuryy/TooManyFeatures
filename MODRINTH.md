# TMF – Too Many Features

**53 quality-of-life features in one vanilla datapack, and every one of them can be switched on or off.**

Players choose their own features from an in-game menu, and server admins control everything from an admin panel. No mods, no resource pack, no config files: just drop it in and play.

> **Minecraft Java 26.3** · data pack format 121 · singleplayer, Realms and servers

---

## ✨ Highlights

- **53 features** in one pack, each with its own on/off switch
- **Player menu** (`/trigger tmf`): every player picks the features they want for themselves
- **Admin panel:** server-wide switches, presets, player locks, a player inspector, a lag helper, performance mode and a clean uninstall
- **Sensible defaults:** convenience features start switched on, and anything that changes gameplay starts off
- **100 % vanilla:** works on any server that accepts datapacks

---

## 🧰 Features

✅ = on by default · 👤 = each player can turn it off for themselves (*opt-in* = players turn it on themselves)

### ⛏ Mining & tools

| Feature | How it works | |
|---|---|---|
| **Tool Auto-Swap** | When you start breaking a block, the best tool in your inventory for it is swapped into your hand: pickaxe, axe, shovel, hoe or shears, highest material first. While you keep mining, for example when tunnelling, it switches tools as soon as you look at a block that needs a different one. Chests, doors, crafting tables and other blocks you right-click are ignored. It pauses briefly after combat. Sneak to stop it. | opt-in |
| **Tool Protector** | When the tool in your hand is down to 2 durability, an identical spare from your inventory is swapped in. If there's no spare, you get a warning before it breaks. | opt-in |
| **Veinminer** | Mine an ore with a pickaxe to mine the whole connected vein, up to 64 blocks, deepslate variants included. Fortune, Silk Touch and XP drops work as normal. Each player picks **Off**, **Sneaking** (default) or **Always**. | 👤 |
| **Tree Feller** | Chop a log with an axe to fell the whole tree, up to 200 logs, diagonal branches included. It only fells real trees whose trunk ends in natural leaves, so your log cabin is safe. It also works on crimson and warped stems. Each player picks **Off**, **Sneaking** (default) or **Always**. | 👤 |
| **Fast Leaf Decay** | After you chop a tree, the leaves left floating disappear within about a second, with normal sapling, stick and apple drops. | |
| **Armor Warning** | A sound and a message when a piece of armor or your elytra has 20 or less durability left. | ✅ 👤 |

### 🌾 Farming & building

| Feature | How it works | |
|---|---|---|
| **Right-Click Harvest** | Right-click a fully grown crop to harvest and replant it. Works on wheat, carrots, potatoes, beetroot, nether wart and cocoa. Fortune works, and one seed from the drops is used for replanting. | 👤 |
| **No Crop Trampling** | Jumping or falling onto farmland no longer turns it back into dirt. | |
| **Ladder Dropping** | Right-click a ladder while holding ladders and a new one is placed at the bottom of the column, even with no wall behind it, so you can drop ladders down open shafts. Left-click breaks it. | ✅ 👤 |
| **Double Doors** | Opening one door of a pair opens both. Sneak to open just one. | ✅ 👤 |
| **Invisible Item Frames** | Right-click an item frame or glow item frame with shears to make it invisible, and again to bring it back. | ✅ 👤 |
| **Spawn-Proof Checker** | Sneak while holding a torch to see a small flame on every block around you where monsters can spawn. | 👤 |
| **Cauldron Trash** | Throw items into a lava cauldron to destroy them, even netherite. | |
| **Sapling Replant** | Saplings, azaleas and mangrove propagules lying on dirt, grass or moss for 30 seconds plant themselves. | |

### 🎒 Inventory

| Feature | How it works | |
|---|---|---|
| **Sort Chest** | Sneak and right-click a chest or barrel with empty hands: its contents are stacked and sorted by name. Double chests are sorted as one. | opt-in |
| **Item Magnet** | Dropped items and XP within 7 blocks fly to you. Sneak to pause it. Items you throw yourself are ignored. Off by default; an admin can switch it on. | opt-in |
| **Pickup Notices** | A short note above the hotbar shows what you just got, e.g. *+12 Cobblestone*. | ✅ 👤 |
| **Shulker Preview** | Sneak while holding a shulker box to list its contents in chat, grouped by item, with hover tooltips. | ✅ 👤 |

### 🐾 Pets & mobs

| Feature | How it works | |
|---|---|---|
| **Pet Protection** | Your tamed pets can't be hurt by you. Admins can extend this to all players. | ✅ |
| **Pet Health** | Sneak and look at a tamed animal to see its health. | ✅ 👤 |
| **Animal Owners** | Sneak and look at a tamed animal to see who owns it, even when the owner is offline. | ✅ 👤 |
| **Pet Teleport** | Wolves, cats and parrots that are following you (not sitting, not leashed) come with you through portals. | ✅ 👤 |
| **Horse Stats** | Sneak and right-click a horse, donkey, mule, llama or camel to see its speed, jump height, health and owner, with "% of max" ratings for breeding. | ✅ 👤 |
| **Silence Mobs** | Use a name tag to name a mob *Silence*, *Quiet* or *Shh* and it goes silent. | ✅ |
| **No Phantoms** | Phantoms stop spawning. The original game rule comes back when you turn this off. | |
| **Breeding Info** | Hold an animal's food and look at it to see if it's ready to breed, its breeding cooldown, or when a baby grows up. | ✅ 👤 |
| **Wandering Trader Alert** | When a wandering trader appears within 200 blocks, you get a chat message with its rough distance and direction. | opt-in |

### ⚔ Combat

| Feature | How it works | |
|---|---|---|
| **Health Bars** | Mobs you hit show a colour-coded health bar and their HP for a few seconds. Mobs you've named are never renamed. | ✅ |
| **Damage Numbers** | Floating numbers show the damage of every hit, with ☠ on killing blows. | ✅ |
| **Death-Drop Glow** | Items you drop when you die glow and stay for 10 minutes. You get the coordinates in chat and can click them to copy. | ✅ |
| **Campfire Regen** | Stand within 4 blocks of a lit campfire to feel its warmth and heal about one heart every 5 seconds. | ✅ |
| **Arrow Counter** | Hold a bow or crossbow to see how many normal, spectral and tipped arrows you have left, and whether your bow has Infinity. | ✅ 👤 |

### 🛡 Mob griefing

| Feature | How it works | |
|---|---|---|
| **Creeper No-Grief** | Creeper explosions don't break blocks, item frames or armor stands. Players and mobs nearby still take the explosion damage. | |
| **Ghast No-Grief** | Ghast fireballs don't break blocks or start fires, but still hurt. Sending them back still works. | |
| **No Zombie Door Breaking** | Zombies, husks and zombie villagers can't break wooden doors on Hard any more. | |
| **Enderman Anti-Grief** | Endermen can't pick up blocks any more. | |
| *Vanilla mob griefing* | The admin page also has a switch for the `mob_griefing` game rule, which turns off griefing by all mobs at once. | |

### 🔍 Info & HUD

| Feature | How it works | |
|---|---|---|
| **Coordinates HUD** | Your XYZ and facing direction in a small bar at the top of the screen, in a light grey that doesn't get in the way. | opt-in |
| **Waypoints** | Save up to 3 places from the menu (Home, Base, Farm, Mine, Portal, …) and pick one to be guided there: the top bar shows an arrow, the distance and how far up or down it is. You can also be guided back to your last death point. | 👤 |
| **Biome Change Info** | *Entering Cherry Grove* appears above the hotbar when you walk into a new biome. | opt-in |
| **Day Counter** | At the start of every in-game day, *Day N* appears above the hotbar. | ✅ 👤 |
| **Crop Growth Info** | Sneak and look at a crop, stem, berry bush, cave vine or sapling to see how far it has grown, and whether its farmland is dry. | ✅ 👤 |
| **Campfire Timer** | Sneak and look at a campfire to see how long each item still needs. | ✅ 👤 |
| **Furnace Progress** | Sneak and look at a furnace, smoker or blast furnace: what it's smelting, progress, time left for the item and the whole stack, fuel left and the output. | ✅ 👤 |
| **Copper Oxidation Info** | Sneak and look at any copper block to see its oxidation stage and whether it's waxed. | ✅ 👤 |
| **Slime Chunk Checker** | Hold a slimeball to see whether you're standing in a slime chunk. An admin pastes the world seed once and TMF checks it. | 👤 |
| **Compass Coordinates** | Hold a lodestone compass to see the coordinates and distance of its lodestone. A recovery compass shows where you last died. | 👤 |

### 🧭 Movement

| Feature | How it works | |
|---|---|---|
| **Faster Paths** | +30 % walking speed on dirt paths. | opt-in |
| **Fence Jumping** | Stand against a fence, wall or closed fence gate and jump to hop onto it and over. | opt-in |

### 👥 Multiplayer

| Feature | How it works | |
|---|---|---|
| **AFK Detection** | Players idle for 5 minutes (adjustable) get an `[AFK]` grey name and an announcement, and they don't block skipping the night. | |
| **Stats Card** | `/trigger tmf.stats` shows playtime, deaths, kills, distance walked and ridden, damage, fish caught, trades and more. A *Share* button posts a summary to chat. | ✅ |
| **Join & Leave Messages** | A welcome message, a first-join announcement, and each player's session length when they leave. | |
| **Playtime Milestones** | A server-wide announcement when a player reaches 1, 5, 10, 25, 50, 100, 250, 500 or 1000 hours played. | ✅ |
| **Entity Crowd Warning** | Every 30 seconds the chunks around each player are counted. Admins get a chat warning with a teleport button when one holds more entities than the limit (200 by default). | ✅ |

---

## 🎛 Player menu

Type **`/trigger tmf`** to open your personal settings, sorted into categories. Every feature with 👤 or *opt-in* can be switched on or off just for you. Tool Protector, Tool Auto-Swap, the Coordinates HUD, Faster Paths, Fence Jumping and Biome Change Info start switched off, so turn them on there if you want them. Veinminer and Tree Feller cycle between *Sneaking*, *Always* and *Off*, and *📍 Waypoints…* opens your waypoints. Features the server has switched off don't appear, and features an admin made mandatory show a 🔒.

## 🛡 Admin panel

Operators run **`/function tmf:admin`** once to become an TMF admin. After that, the panel opens from the player menu or with `/trigger tmf set 2`.

- **Feature switches:** each feature can be turned on or off for the whole server, grouped into nine categories so you can find them quickly.
- **Presets:** *Everything on* · *Recommended* (the defaults) · *Minimal* (info features only) · *All off*
- **Player locks:** force a personal feature on for everyone.
- **Performance mode:** pauses health bars and damage numbers and slows down the background scans on busy servers.
- **Settings:** AFK timeout (2–30 min), the percentage of players needed to sleep, and the entity warning limit.
- **Player inspector:** online status, position, health, food, level, game mode, AFK state, playtime, deaths and kills of any player, with the last known position and time for offline players, and a teleport button.
- **Lag helper:** counts loaded entities by kind and near each player, and clears old dropped items, XP orbs, stuck arrows or hostile mobs that aren't name-tagged.
- **Slime chunk seed:** paste the number from `/seed` once for the Slime Chunk Checker.
- **Changelog** and a full **Uninstall** that removes every scoreboard, tag and helper entity and restores the game rules it changed.

All settings are saved in the world.

---

## 📦 Installation

1. Put the datapack (the zip or the folder) into `<world>/datapacks/`.
2. **Restart the world or server.** Single-player: Save and Quit to Title, then open the world again. A plain `/reload` isn't enough the first time, because Pet Protection uses a custom enchantment and the game only loads enchantments when a world opens.
3. You'll see **"TMF - loaded"** in chat. Operators then run `/function tmf:admin` once.

**Commands**

| Command | Who | What it does |
|---|---|---|
| `/trigger tmf` | everyone | personal settings menu |
| `/trigger tmf.stats` | everyone | your stats card |
| `/trigger tmf set 3` | everyone | which features the server has enabled |
| `/function tmf:admin` | operators | become an TMF admin and open the admin panel |
| `/trigger tmf set 2` | TMF admins | open the admin panel |

---

## ⚠ Limitations & good to know

These come from what vanilla datapacks can and can't do:

- **Stats Card** counts from the moment TMF was added to the world. Datapacks can't read stats from before that.
- **Spawn-Proof Checker** is exact in caves and indoors. The game only gives datapacks a combined sunlight + torchlight value, so unlit spots outdoors (where the sky is visible) can't be detected.
- **Click-catchers:** Ladder Dropping, Right-Click Harvest and Tool Auto-Swap work by putting an invisible click-catcher over the ladder, ripe crop or block you look at, within 3 blocks.
  - While you look at a ripe crop up close, right-click harvests it instead of eating or raising a shield.
  - Sneaking always gives normal vanilla behaviour.
  - If Tool Auto-Swap catches a right-click (for example an offhand torch), the first click is skipped and it steps aside for 2 seconds, so just click again.
- **Tool Auto-Swap** needs a tool or sword in your hand; it never swaps into an empty hand or away from blocks you're holding. It won't replace a tool of the right type that you're already holding, such as a silk-touch pickaxe. Mining with an Unbreaking tool can occasionally end the 5-second "mining" window early, and then one fresh click starts it again.
- **Pickup Notices** compare your inventory before and after each change, so items taken from chests or crafted also show up (gains only, up to 4 item types at once).
- **Sort Chest** sorts alphabetically by item ID and only merges truly identical items, so different enchantments or names are never combined.
- **Item Magnet** moves items in a straight line toward you, so it can pull them through walls.
- **Playtime Milestones** use the same playtime as the Stats Card, counted from when TMF was added.
- **Veinminer and Tree Feller** use 1 durability per extra block (Unbreaking isn't applied to those blocks) and stop before your tool would break. They don't run in creative mode.
- **Tree Feller** recognises a tree by the natural leaves at the top of its trunk; leaves placed by players don't count, so log buildings are never felled. It stays within 7 blocks sideways of the log you chopped, so a log wall touching a tree's lower trunk could lose a few logs.
- **Ladders** placed in mid-air stay up until a block next to them changes, just like any unsupported ladder.
- **No Crop Trampling** protects farmland from players only; mobs can still trample it unless `mob_griefing` is off. It also means landing on farmland causes no fall damage.
- **Pet Protection** works through an invisible, enchanted barrier item in the pet's unused feet slot. It never drops, and the pet is protected within a second of being tamed or seen.
- **Enderman Anti-Grief** gives endermen an invisible "structure void" to hold, so they can't pick anything else up. If one ever puts it down, TMF removes it straight away.
- **AFK Detection** manages `players_sleeping_percentage` while it's on, so change the base value in the admin panel instead of with `/gamerule`. The grey AFK name only applies to players who aren't already on another team.
- **Health Bars** temporarily use the mob's name tag slot, but mobs that already have a name are never touched.
- **Fast Leaf Decay** only reacts to trees chopped by players.
- **Creeper and Ghast No-Grief** set the explosion size to 0 and deal the damage themselves with the vanilla distance falloff. Difficulty and Blast Protection apply, but walls don't shield you and there's no knockback.
- **No Zombie Door Breaking** doesn't cover vindicators in raids.
- **Coordinates and waypoints** use a boss bar that only you can see, so an empty bar shows under the text.
- **Waypoint names** come from a list (Home, Base, Farm, …), because datapacks can't receive typed text from players without operator rights.
- **Slime Chunk Checker** needs the seed typed in once: `/seed` only gives datapacks the lower 32 bits, and slime chunks depend on 48. TMF checks the part it can read before saving.
- **Animal Owners** and the **Player inspector** know players who have joined since TMF v1.11.
- **Chat and real-world time:** datapacks can't read chat messages or the real-world date, so features such as name pings or real daily login streaks aren't possible.

---

## ❓ FAQ

**Does it work on servers?** Yes, on any Java 26.3 server that loads datapacks.

**Will it conflict with other datapacks?** Everything lives in the `tmf` namespace and no vanilla files are replaced. The only shared things are game rules (`spawn_phantoms`, `players_sleeping_percentage`, and `mob_griefing` if you use its switch), which are touched only when the related feature or switch is used.

**How do I remove it?** Open the admin panel → *Uninstall TMF…*, then delete the datapack from the `datapacks` folder.
