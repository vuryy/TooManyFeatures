#!/usr/bin/env python3
"""Generator for the TMF datapack (Minecraft Java 26.3, data pack format 121)."""
import json, os, shutil, textwrap, sys

# Usage: python tools/gen.py [output_dir]
# By default the pack is regenerated into the repository root (the folder above tools/).
# Only <output>/data and <output>/pack.mcmeta are replaced; everything else is left alone.
OUT = sys.argv[1] if len(sys.argv) > 1 else os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
NS = "tmf"
VERSION = "1.10.0"

if os.path.isdir(os.path.join(OUT, "data")):
    shutil.rmtree(os.path.join(OUT, "data"))

def w(rel, content):
    p = os.path.join(OUT, rel)
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "w", encoding="utf-8", newline="\n") as f:
        f.write(content)

def fn(path, body):
    body = "\n".join(l.strip() for l in textwrap.dedent(body).strip("\n").split("\n")) + "\n"
    w(f"data/{NS}/function/{path}.mcfunction", body)

def js(rel, obj):
    w(rel, json.dumps(obj, indent=2, ensure_ascii=False) + "\n")

def q(s):
    """Quote a string for SNBT."""
    return json.dumps(s, ensure_ascii=False)

# ---------------------------------------------------------------------------
# Feature registry
#   key, number, display name, description, personal mode ("out" = on by default,
#   player may opt out; "in" = off by default, player may opt in; None = server only)
# ---------------------------------------------------------------------------
FEATURES = [
    ("tool_swap",       1,  "Tool Protector",       "When the tool in your hand is about to break, a spare copy from your inventory is swapped in (or you get a warning).", "in"),
    ("shulker_preview", 2,  "Shulker Preview",      "Sneak while holding a shulker box to list its contents in chat.", "out"),
    ("death_glow",      3,  "Death-Drop Glow",      "Items dropped when you die glow and stay for 10 minutes. Your death coordinates are shown.", None),
    ("fast_paths",      4,  "Faster Paths",         "Walk 30% faster on dirt paths.", "out"),
    ("horse_stats",     5,  "Horse Stats",          "Sneak + right-click a horse, donkey, mule, llama or camel to see its speed, jump and health.", "out"),
    ("pet_protect",     6,  "Pet Protection",       "Tamed pets can't be hurt by their owner (or by any player, depending on the server setting).", None),
    ("no_phantoms",     7,  "No Phantoms",          "Phantoms stop spawning.", None),
    ("enderman_guard",  8,  "Enderman Anti-Grief",  "Endermen can no longer pick up blocks.", None),
    ("silence_mobs",    9,  "Silence Mobs",         "Name a mob Silence, Quiet or Shh with a name tag to mute it.", None),
    ("pet_teleport",    10, "Pet Teleport",         "Pets that are following you (not sitting) come with you through portals.", "out"),
    ("ladder_drop",     11, "Ladder Dropping",      "Right-click a ladder while holding a ladder to place one at the bottom of the ladder column. Sneak to place normally.", "out"),
    ("double_doors",    12, "Double Doors",         "Opening one door of a pair opens both. Sneak to open only one.", "out"),
    ("cauldron_trash",  13, "Cauldron Trash",       "Throw items into a lava cauldron to destroy them, even netherite.", None),
    ("health_bars",     14, "Health Bars",          "Mobs you hit show a health bar above their head for a few seconds.", None),
    ("damage_numbers",  15, "Damage Numbers",       "Floating numbers show how much damage your hits deal.", None),
    ("afk",             17, "AFK Detection",        "Idle players are marked AFK (grey name) and don't block skipping the night.", None),
    ("stats_card",      18, "Stats Card",           "Use /trigger tmf.stats to see your playtime and statistics.", None),
    ("join_leave",      19, "Join & Leave Messages","Welcome messages, first-join announcements and session times when players leave.", None),
    ("harvest",         20, "Right-Click Harvest",  "Right-click a fully grown crop (wheat, carrots, potatoes, beetroot, nether wart, cocoa) to harvest and replant it.", "out"),
    ("invisible_frames",21, "Invisible Item Frames","Right-click an item frame with shears to make it invisible (or visible again). Sneak to use shears normally.", "out"),
    ("no_trample",      23, "No Crop Trampling",    "Jumping or falling onto farmland no longer turns it into dirt.", None),
    ("leaf_decay",      24, "Fast Leaf Decay",      "After you chop a tree, its leftover leaves disappear within a second (with normal drops).", None),
    ("armor_warning",   25, "Armor Warning",        "Warns you when a worn armor piece or elytra has 20 or less durability left.", "out"),
    ("best_tool",       26, "Tool Auto-Swap",       "When you start breaking a block, the best tool for it is swapped into your hand. Sneak to stop it.", "in"),
    ("coords_hud",      27, "Coordinates HUD",      "Shows your XYZ coordinates and facing direction above the hotbar.", "in"),
    ("spawn_checker",   28, "Spawn-Proof Checker",  "Sneak while holding a torch to see a small flame on each block where monsters can spawn (light level 0).", "out"),
    ("veinminer",       29, "Veinminer",            "Sneak while mining an ore with a pickaxe to mine the whole connected vein (up to 64 blocks).", "out"),
    ("tree_feller",     30, "Tree Feller",          "Sneak while chopping a log with an axe to fell the whole tree (up to 200 logs).", "out"),
    ("trader_alert",    32, "Wandering Trader Alert","Get a chat message with distance and direction when a wandering trader appears near you.", "in"),
    ("sort_chest",      33, "Sort Chest",           "Sneak + right-click a chest or barrel with empty hands to sort and stack its contents.", "in"),
    ("pickup_notices",  34, "Pickup Notices",       "A short note above the hotbar shows what you just got, e.g. +12 Cobblestone.", "out"),
    ("magnet",          35, "Item Magnet",          "Nearby dropped items and XP fly to you. Sneak to pause it; items you throw yourself are ignored.", "in"),
    ("breed_info",      36, "Breeding Info",        "Look at an animal while holding its food to see if it can breed, its breeding cooldown, or when a baby grows up.", "out"),
    ("sapling_replant", 37, "Sapling Replant",      "Saplings lying on dirt or grass for 30 seconds plant themselves.", None),
    ("copper_info",     38, "Copper Oxidation Info","Sneak and look at a copper block to see its oxidation stage and whether it is waxed.", "out"),
    ("milestones",      39, "Playtime Milestones",  "Announces when a player reaches 1, 5, 10, 25, 50, 100, 250, 500 and 1000 hours played.", None),
    ("day_counter",     40, "Day Counter",          "Shows the day number above the hotbar at the start of every in-game day.", "out"),
    ("fence_jump",      31, "Fence Jumping",        "Walk up against a fence, wall or closed fence gate and jump to get over it.", "out"),
]
FKEYS = [f[0] for f in FEATURES]
DEFAULT_ON = {"shulker_preview", "horse_stats", "pet_protect", "silence_mobs", "pet_teleport", "double_doors", "ladder_drop",
              "health_bars", "damage_numbers", "afk", "stats_card", "invisible_frames", "armor_warning", "fence_jump",
              "fast_paths", "death_glow", "trader_alert", "sort_chest", "pickup_notices", "breed_info",
              "copper_info", "milestones", "day_counter"}
BYKEY = {f[0]: f for f in FEATURES}
PERSONAL = [f for f in FEATURES if f[4]]
CATEGORIES = [
    ("mining", "⛏ Mining & tools", ["best_tool", "tool_swap", "veinminer", "tree_feller", "leaf_decay", "armor_warning"]),
    ("farming", "🌾 Farming & building", ["harvest", "no_trample", "sapling_replant", "ladder_drop", "double_doors",
                                          "invisible_frames", "spawn_checker", "copper_info", "cauldron_trash"]),
    ("inventory", "🎒 Inventory", ["sort_chest", "magnet", "pickup_notices", "shulker_preview"]),
    ("mobs", "🐾 Pets & mobs", ["pet_protect", "pet_teleport", "horse_stats", "breed_info", "silence_mobs",
                               "trader_alert", "enderman_guard", "no_phantoms"]),
    ("combat", "⚔ Combat", ["health_bars", "damage_numbers", "death_glow"]),
    ("movement", "🧭 Movement & info", ["fast_paths", "fence_jump", "coords_hud", "day_counter"]),
    ("multiplayer", "👥 Multiplayer", ["afk", "stats_card", "join_leave", "milestones"]),
]
_all = [k for _, _, ks in CATEGORIES for k in ks]
assert sorted(_all) == sorted(FKEYS), set(_all) ^ set(FKEYS)
CAT_OF = {k: cid for cid, _, ks in CATEGORIES for k in ks}

# ---------------------------------------------------------------------------
# pack.mcmeta
# ---------------------------------------------------------------------------
js("pack.mcmeta", {
    "pack": {
        "description": [
            {"text": "TMF", "color": "gold", "bold": True},
            {"text": " – Too Many Features v" + VERSION + "\n", "color": "gray"},
            {"text": "/trigger tmf", "color": "yellow"}
        ],
        "pack_format": 121,
        "min_format": 121,
        "max_format": 121
    }
})

# ---------------------------------------------------------------------------
# Tags
# ---------------------------------------------------------------------------
js("data/minecraft/tags/function/load.json", {"values": [f"{NS}:load"]})
js("data/minecraft/tags/function/tick.json", {"values": [f"{NS}:tick"]})

DOORS = ['acacia_door', 'bamboo_door', 'birch_door', 'cherry_door', 'copper_door', 'crimson_door',
         'dark_oak_door', 'exposed_copper_door', 'jungle_door', 'mangrove_door', 'oak_door',
         'oxidized_copper_door', 'pale_oak_door', 'poplar_door', 'spruce_door', 'warped_door',
         'waxed_copper_door', 'waxed_exposed_copper_door', 'waxed_oxidized_copper_door',
         'waxed_weathered_copper_door', 'weathered_copper_door']
js(f"data/{NS}/tags/block/doors.json", {"values": ["minecraft:" + d for d in DOORS]})
js(f"data/{NS}/tags/block/ray_pass.json", {"values": [
    "minecraft:air", "minecraft:cave_air", "minecraft:void_air", "minecraft:water", "minecraft:lava",
    "minecraft:bubble_column", "minecraft:light", "minecraft:structure_void"]})
js(f"data/{NS}/tags/block/ladder_space.json", {"values": [
    "minecraft:air", "minecraft:cave_air", "minecraft:void_air", "minecraft:water"]})
js(f"data/{NS}/tags/block/no_ladder_support.json", {"values": [
    "#minecraft:replaceable", "#minecraft:fences", "#minecraft:walls", "#minecraft:trapdoors",
    "#minecraft:doors", "minecraft:ladder", "minecraft:glass_pane", "minecraft:iron_bars",
    "minecraft:torch", "minecraft:wall_torch", "minecraft:lantern", "minecraft:scaffolding"]})

js(f"data/{NS}/tags/entity_type/pets.json", {"values": [
    "minecraft:wolf", "minecraft:cat", "minecraft:parrot", "minecraft:horse", "minecraft:donkey",
    "minecraft:mule", "minecraft:llama", "minecraft:trader_llama", "minecraft:camel",
    "minecraft:skeleton_horse", "minecraft:zombie_horse", "minecraft:nautilus", "minecraft:zombie_nautilus"]})
js(f"data/{NS}/tags/entity_type/followers.json", {"values": [
    "minecraft:wolf", "minecraft:cat", "minecraft:parrot"]})
js(f"data/{NS}/tags/entity_type/horses.json", {"values": [
    "minecraft:horse", "minecraft:donkey", "minecraft:mule", "minecraft:llama", "minecraft:trader_llama",
    "minecraft:camel", "minecraft:camel_husk", "minecraft:skeleton_horse", "minecraft:zombie_horse"]})
js(f"data/{NS}/tags/entity_type/no_bar.json", {"values": [
    "#tmf:pets", "minecraft:player", "minecraft:armor_stand", "minecraft:ender_dragon", "minecraft:wither",
    "minecraft:item", "minecraft:experience_orb", "minecraft:marker", "minecraft:interaction",
    "minecraft:text_display", "minecraft:item_display", "minecraft:block_display",
    "minecraft:item_frame", "minecraft:glow_item_frame", "minecraft:painting", "#minecraft:arrows",
    "#minecraft:impact_projectiles", "minecraft:falling_block", "minecraft:tnt", "#minecraft:boat",
    "minecraft:minecart", "minecraft:chest_minecart", "minecraft:hopper_minecart", "minecraft:tnt_minecart",
    "minecraft:furnace_minecart", "minecraft:spawner_minecart", "minecraft:command_block_minecart",
    "minecraft:area_effect_cloud", "minecraft:lightning_bolt", "minecraft:end_crystal", "minecraft:eye_of_ender",
    "minecraft:fishing_bobber", "minecraft:leash_knot", "minecraft:evoker_fangs", "minecraft:firework_rocket",
    "minecraft:villager", "minecraft:wandering_trader"]})

# ---------------------------------------------------------------------------
# Predicates
# ---------------------------------------------------------------------------
def entity_pred(pred, entity="this"):
    return {"type": "minecraft:entity_properties", "entity": entity, "predicate": pred}

js(f"data/{NS}/predicate/sneaking.json", entity_pred({"minecraft:flags": {"is_sneaking": True}}))
js(f"data/{NS}/predicate/on_ground.json", entity_pred({"minecraft:flags": {"is_on_ground": True}}))
js(f"data/{NS}/predicate/looking_at_candidate.json", entity_pred({
    "minecraft:type_specific/player": {"looking_at": {"minecraft:entity_tags": {"all_of": ["tmf.hs_cand"]}}}}))

# ---------------------------------------------------------------------------
# Loot table used to read a player's name (fill_player_head copies the profile)
# ---------------------------------------------------------------------------
js(f"data/{NS}/loot_table/player_head.json", {
    "pools": [{
        "rolls": 1,
        "entries": [{
            "type": "minecraft:item",
            "name": "minecraft:player_head",
            "modifier": {"type": "minecraft:fill_player_head", "entity": "this"}
        }]
    }]
})

# ---------------------------------------------------------------------------
# Pet guard enchantment (gives pets damage immunity against their owner / players)
# ---------------------------------------------------------------------------
def score_of(holder, obj):
    return {"type": "minecraft:score", "target": {"type": "minecraft:fixed", "name": holder}, "score": obj}

js(f"data/{NS}/enchantment/pet_guard.json", {
    "description": {"text": "TMF Pet Guard"},
    "supported_items": "minecraft:barrier",
    "weight": 1,
    "max_level": 1,
    "min_cost": {"base": 1, "per_level_above_first": 0},
    "max_cost": {"base": 1, "per_level_above_first": 0},
    "anvil_cost": 0,
    "slots": ["feet"],
    "effects": {
        "minecraft:damage_immunity": [{
            "requirements": {
                "type": "minecraft:all_of",
                "terms": [
                    {"type": "minecraft:int_value_check", "value": score_of("#pet_protect", "tmf.cfg"), "test": {"min": 1}},
                    {"type": "minecraft:entity_properties", "entity": "attacker",
                     "predicate": {"minecraft:entity_type": "minecraft:player"}},
                    {"type": "minecraft:any_of", "terms": [
                        {"type": "minecraft:int_value_check", "value": score_of("#pet_protect", "tmf.cfg"), "test": {"min": 2}},
                        {"type": "minecraft:entity_scores", "entity": "attacker", "scores": {
                            "tmf.id": {
                                "min": {"type": "minecraft:score", "target": "this", "score": "tmf.oid"},
                                "max": {"type": "minecraft:score", "target": "this", "score": "tmf.oid"}
                            }
                        }}
                    ]}
                ]
            },
            "effect": {}
        }]
    }
})

# ---------------------------------------------------------------------------
# Advancements (event detection). All hidden (no display).
# ---------------------------------------------------------------------------
def adv(name, trigger, conditions, reward):
    crit = {"trigger": f"minecraft:{trigger}"}
    if conditions:
        crit["conditions"] = conditions
    js(f"data/{NS}/advancement/{name}.json", {
        "criteria": {"e": crit},
        "rewards": {"function": f"{NS}:{reward}"}
    })

SNEAK = entity_pred({"minecraft:flags": {"is_sneaking": True}})

adv("tool_swap/damaged", "item_durability_changed", {"durability": {"max": 2}, "delta": {"max": -1}}, "tool_swap/on_damage")
adv("horse_stats/interact", "player_interacted_with_entity", {
    "player": SNEAK,
    "entity": entity_pred({"minecraft:entity_type": "#tmf:horses"})
}, "horse/interact")
adv("pets/changed_dimension", "changed_dimension", None, "pets/dim_change")
adv("overlay/click", "player_interacted_with_entity", {
    "entity": entity_pred({"minecraft:entity_type": "minecraft:interaction",
                           "minecraft:entity_tags": {"all_of": ["tmf.ov"]}})
}, "overlay/on_click")
for state in ("true", "false"):
    adv(f"doors/{'opened' if state == 'true' else 'closed'}", "default_block_use", {
        "location": {"type": "minecraft:location_check", "predicate": {
            "block": {"blocks": "#tmf:doors", "state": {"open": state, "half": "lower"}}}}
    }, f"doors/{'opened' if state == 'true' else 'closed'}")
    adv(f"doors/{'opened' if state == 'true' else 'closed'}_upper", "default_block_use", {
        "location": {"type": "minecraft:location_check", "predicate": {
            "block": {"blocks": "#tmf:doors", "state": {"open": state, "half": "upper"}}}}
    }, f"doors/{'opened' if state == 'true' else 'closed'}_upper")

# Damage bins: the advancement that matches tells us how much damage was dealt.
BINS = [(0.0, 0.25, 0)]
for i in range(1, 61):            # 0.5 .. 30.0 in steps of 0.5
    c = i * 0.5
    BINS.append((c - 0.25, c + 0.25, int(round(c * 10))))
for c in range(31, 61):           # 31 .. 60 in steps of 1
    BINS.append((c - 0.5, c + 0.5, c * 10))
BINS.append((60.5, None, 999))    # 60+
for n, (lo, hi, val) in enumerate(BINS):
    rng = {"min": lo}
    if hi is not None:
        rng["max"] = round(hi - 0.0001, 4)
    adv(f"combat/hit_{n}", "player_hurt_entity", {"damage": {"taken": rng}, "entity": {
        "type": "minecraft:inverted", "term": entity_pred({"minecraft:entity_type": "#tmf:no_bar"})}}, f"combat/bin/{n}")
    fn(f"combat/bin/{n}", f"""
        advancement revoke @s only {NS}:combat/hit_{n}
        scoreboard players set #dmg tmf.tmp {val}
        function {NS}:combat/on_hurt
    """)

# ---------------------------------------------------------------------------
# Load / install / tick / loops
# ---------------------------------------------------------------------------
STAT_OBJ = {
    "tmf.s.play": "minecraft.custom:minecraft.play_time",
    "tmf.s.deaths": "minecraft.custom:minecraft.deaths",
    "tmf.s.mobs": "minecraft.custom:minecraft.mob_kills",
    "tmf.s.pk": "minecraft.custom:minecraft.player_kills",
    "tmf.s.walk": "minecraft.custom:minecraft.walk_one_cm",
    "tmf.s.sprint": "minecraft.custom:minecraft.sprint_one_cm",
    "tmf.s.crouch": "minecraft.custom:minecraft.crouch_one_cm",
    "tmf.s.swim": "minecraft.custom:minecraft.swim_one_cm",
    "tmf.s.wow": "minecraft.custom:minecraft.walk_on_water_one_cm",
    "tmf.s.wuw": "minecraft.custom:minecraft.walk_under_water_one_cm",
    "tmf.s.climb": "minecraft.custom:minecraft.climb_one_cm",
    "tmf.s.fly": "minecraft.custom:minecraft.aviate_one_cm",
    "tmf.s.boat": "minecraft.custom:minecraft.boat_one_cm",
    "tmf.s.horse": "minecraft.custom:minecraft.horse_one_cm",
    "tmf.s.cart": "minecraft.custom:minecraft.minecart_one_cm",
    "tmf.s.pig": "minecraft.custom:minecraft.pig_one_cm",
    "tmf.s.strider": "minecraft.custom:minecraft.strider_one_cm",
    "tmf.s.ghast": "minecraft.custom:minecraft.happy_ghast_one_cm",
    "tmf.s.naut": "minecraft.custom:minecraft.nautilus_one_cm",
    "tmf.s.jump": "minecraft.custom:minecraft.jump",
    "tmf.s.dmgd": "minecraft.custom:minecraft.damage_dealt",
    "tmf.s.dmgt": "minecraft.custom:minecraft.damage_taken",
    "tmf.s.since": "minecraft.custom:minecraft.time_since_death",
    "tmf.s.fish": "minecraft.custom:minecraft.fish_caught",
    "tmf.s.bred": "minecraft.custom:minecraft.animals_bred",
    "tmf.s.trade": "minecraft.custom:minecraft.traded_with_villager",
    "tmf.s.ench": "minecraft.custom:minecraft.enchant_item",
    "tmf.s.sleep": "minecraft.custom:minecraft.sleep_in_bed",
}
DUMMIES = ["tmf.cfg", "tmf.tmp", "tmf.c", "tmf.id", "tmf.oid", "tmf.cd", "tmf.hp", "tmf.lhp", "tmf.hbt",
           "tmf.dnt", "tmf.hitt", "tmf.afk", "tmf.px", "tmf.py", "tmf.pz", "tmf.rx", "tmf.ry", "tmf.dim",
           "tmf.sess", "tmf.abt", "tmf.swapcd", "tmf.share", "tmf.mine", "tmf.fight", "tmf.ldt", "tmf.pcd",
           "tmf.awh", "tmf.awc", "tmf.awl", "tmf.awf", "tmf.awe", "tmf.btsup", "tmf.ms"]
LOGS = ['dark_oak_log', 'dark_oak_wood', 'stripped_dark_oak_log', 'stripped_dark_oak_wood', 'pale_oak_log', 'pale_oak_wood',
        'stripped_pale_oak_log', 'stripped_pale_oak_wood', 'oak_log', 'oak_wood', 'stripped_oak_log', 'stripped_oak_wood',
        'acacia_log', 'acacia_wood', 'stripped_acacia_log', 'stripped_acacia_wood', 'birch_log', 'birch_wood',
        'stripped_birch_log', 'stripped_birch_wood', 'jungle_log', 'jungle_wood', 'stripped_jungle_log', 'stripped_jungle_wood',
        'spruce_log', 'spruce_wood', 'stripped_spruce_log', 'stripped_spruce_wood', 'mangrove_log', 'mangrove_wood',
        'stripped_mangrove_log', 'stripped_mangrove_wood', 'cherry_log', 'cherry_wood', 'stripped_cherry_log',
        'stripped_cherry_wood', 'poplar_log', 'poplar_wood', 'stripped_poplar_log', 'stripped_poplar_wood',
        'crimson_stem', 'stripped_crimson_stem', 'crimson_hyphae', 'stripped_crimson_hyphae',
        'warped_stem', 'stripped_warped_stem', 'warped_hyphae', 'stripped_warped_hyphae']
def log_family(l):
    for fam in ("dark_oak", "pale_oak", "oak", "spruce", "birch", "jungle", "acacia", "mangrove", "cherry", "poplar"):
        if fam in l:
            return f"minecraft:{fam}_logs"
    return "minecraft:crimson_stems" if "crimson" in l else "minecraft:warped_stems"
ORES = [  # block, family tag, xp per block
    ("coal_ore", "minecraft:coal_ores", 1), ("deepslate_coal_ore", "minecraft:coal_ores", 1),
    ("iron_ore", "minecraft:iron_ores", 0), ("deepslate_iron_ore", "minecraft:iron_ores", 0),
    ("copper_ore", "minecraft:copper_ores", 0), ("deepslate_copper_ore", "minecraft:copper_ores", 0),
    ("gold_ore", "minecraft:gold_ores", 0), ("deepslate_gold_ore", "minecraft:gold_ores", 0), ("nether_gold_ore", "minecraft:gold_ores", 1),
    ("redstone_ore", "minecraft:redstone_ores", 3), ("deepslate_redstone_ore", "minecraft:redstone_ores", 3),
    ("lapis_ore", "minecraft:lapis_ores", 3), ("deepslate_lapis_ore", "minecraft:lapis_ores", 3),
    ("diamond_ore", "minecraft:diamond_ores", 5), ("deepslate_diamond_ore", "minecraft:diamond_ores", 5),
    ("emerald_ore", "minecraft:emerald_ores", 5), ("deepslate_emerald_ore", "minecraft:emerald_ores", 5),
    ("nether_quartz_ore", "tmf:vein/quartz", 3), ("ancient_debris", "tmf:vein/debris", 0),
]
for i, l in enumerate(LOGS):
    STAT_OBJ[f"tmf.lg.{i}"] = f"minecraft.mined:minecraft.{l}"
STAT_OBJ["tmf.drop"] = "minecraft.custom:minecraft.drop"
for i, (o, fam, xp) in enumerate(ORES):
    STAT_OBJ[f"tmf.or.{i}"] = f"minecraft.mined:minecraft.{o}"

bars = []
for i in range(11):
    bars.append({"f": "|" * (i * 2), "e": "|" * ((10 - i) * 2),
                 "c": "green" if i >= 7 else ("yellow" if i >= 4 else "red")})

fn("load", f"""
    # TMF v{VERSION} – load
    {chr(10).join(f'scoreboard objectives add {o} dummy' for o in DUMMIES)}
    scoreboard objectives add tmf trigger {{text:"TMF menu"}}
    scoreboard objectives add tmf.stats trigger {{text:"TMF stats"}}
    scoreboard objectives add tmf.deaths deathCount
    scoreboard objectives add tmf.leave minecraft.custom:minecraft.leave_game
    {chr(10).join(f'scoreboard objectives add {o} {c}' for o, c in STAT_OBJ.items())}

    team add tmf.afk {{text:"AFK"}}
    team modify tmf.afk color gray
    team modify tmf.afk prefix {{text:"[AFK] ",color:"dark_gray"}}

    # constants
    scoreboard players set #2 tmf.c 2
    scoreboard players set #m1 tmf.c -1
    scoreboard players set #20 tmf.c 20
    function tmf:sort/init_rank
    scoreboard players set #5 tmf.c 5
    scoreboard players set #10 tmf.c 10
    scoreboard players set #24 tmf.c 24
    scoreboard players set #60 tmf.c 60
    scoreboard players set #100 tmf.c 100
    scoreboard players set #1000 tmf.c 1000
    scoreboard players set #1200 tmf.c 1200
    scoreboard players set #4216 tmf.c 4216
    scoreboard players set #10000 tmf.c 10000
    scoreboard players set #72000 tmf.c 72000
    scoreboard players set #100000 tmf.c 100000
    scoreboard players set #1728000 tmf.c 1728000

    data modify storage tmf:data bars set value {json.dumps(bars).replace('"f"','f').replace('"e"','e').replace('"c"','c')}
    data modify storage tmf:data version set value "{VERSION}"

    execute unless score #installed tmf.cfg matches 1 run function tmf:config/install
    # upgrades: features added in a newer version start switched on
    {chr(10).join(f'execute unless score #{k} tmf.cfg matches -2147483648.. run scoreboard players set #{k} tmf.cfg {1 if k in DEFAULT_ON else 0}' for k in FKEYS)}
    # v1.4.0: switch to the new default feature set once
    execute unless score #defaults_v tmf.cfg matches 2.. run function tmf:admin/preset/recommended_silent
    scoreboard players set #defaults_v tmf.cfg 2
    # v1.9.2: Item Magnet is now off by default
    execute unless score #defaults_v3 tmf.cfg matches 1 run scoreboard players set #magnet tmf.cfg 0
    scoreboard players set #defaults_v3 tmf.cfg 1
    function tmf:config/apply

    execute unless data storage tmf:data online run data modify storage tmf:data online set value []
    execute as @a at @s run function tmf:join/ensure_online

    schedule function tmf:loop/t5 5t replace
    schedule function tmf:loop/t20 20t replace
    tellraw @a {{text:"TMF - loaded"}}
""")

defaults = "\n".join(f"scoreboard players set #{k} tmf.cfg {1 if k in DEFAULT_ON else 0}" for k in FKEYS)
fn("config/install", f"""
    # First-time install: default settings
    scoreboard players set #installed tmf.cfg 1
    function tmf:legacy_cleanup
    kill @e[type=minecraft:marker,tag=tmf.plog]
    scoreboard players set #next tmf.id 0
    execute as @a unless score @s tmf.id matches 1.. run function tmf:join/assign_id
    tag @a add tmf.known
    {defaults}
    function tmf:config/defaults_values
    execute store result score #sleep_pct tmf.cfg run gamerule players_sleeping_percentage
    execute store result score #phantoms_orig tmf.cfg run gamerule spawn_phantoms
""")
fn("config/defaults_values", """
    scoreboard players set #perf tmf.cfg 0
    scoreboard players set #afk_min tmf.cfg 5
""")

# apply: keep game rules in sync with toggles
fn("config/apply", """
    execute if score #no_phantoms tmf.cfg matches 1 run gamerule spawn_phantoms false
    execute if score #no_phantoms tmf.cfg matches 0 if score #phantoms_orig tmf.cfg matches 1 run gamerule spawn_phantoms true
    execute if score #afk tmf.cfg matches 0 run function tmf:afk/restore_sleep
""")

fn("tick", """
    execute unless score #installed tmf.cfg matches 1 run return 0
    scoreboard players add #tick tmf.c 1

    # --- menus / triggers ---
    execute as @a[scores={tmf=1..}] run function tmf:menu/trigger
    execute as @a[scores={tmf.stats=1..}] run function tmf:stats/trigger
    scoreboard players enable @a tmf
    scoreboard players enable @a tmf.stats

    # --- joins ---
    execute as @a[tag=!tmf.known] at @s run function tmf:join/first_join
    execute as @a[scores={tmf.leave=1..}] at @s run function tmf:join/rejoin

    # --- death-drop glow ---
    execute as @a[scores={tmf.deaths=1..}] run function tmf:death_glow/on_death

    # --- shulker preview (on the tick the player starts sneaking) ---
    execute if score #shulker_preview tmf.cfg matches 1 as @a[tag=!tmf.sneaking,tag=!tmf.off.shulker_preview,predicate=tmf:sneaking] if items entity @s weapon.mainhand #minecraft:shulker_boxes run function tmf:shulker/show
    tag @a[tag=tmf.sneaking,predicate=!tmf:sneaking] remove tmf.sneaking
    tag @a[tag=!tmf.sneaking,predicate=tmf:sneaking] add tmf.sneaking

    # --- faster paths ---
    execute if score #fast_paths tmf.cfg matches 1 as @a[tag=!tmf.onpath,tag=!tmf.off.fast_paths,gamemode=!spectator] at @s if function tmf:paths/on_path run function tmf:paths/add
    execute as @a[tag=tmf.onpath] at @s unless function tmf:paths/keep run function tmf:paths/remove

    # --- click overlays (ladder dropping, right-click harvest, tool auto-swap) ---
    function tmf:overlay/tick

    # --- held-item flags used by event handlers ---
    tag @a[tag=tmf.sh] remove tmf.sh
    execute as @a if items entity @s weapon.mainhand minecraft:shears run tag @s add tmf.sh

    # --- no crop trampling ---
    execute if score #no_trample tmf.cfg matches 1 as @a[gamemode=!spectator,tag=!tmf.ntsf,predicate=tmf:falling_unprotected] at @s if function tmf:trample/above_farmland run function tmf:trample/protect
    execute as @a[tag=tmf.ntsf,predicate=tmf:on_ground] run function tmf:trample/landed

    # --- logs chopped (fast leaf decay + tree feller) / ores mined (veinminer) ---
    execute if score #leaf_decay tmf.cfg matches 1 run function tmf:leaves/check_chops
    execute unless score #leaf_decay tmf.cfg matches 1 if score #tree_feller tmf.cfg matches 1 run function tmf:leaves/check_chops
    execute if score #veinminer tmf.cfg matches 1 run function tmf:vein/check

    # --- fence jumping ---
    execute if score #fence_jump tmf.cfg matches 1 as @a[tag=!tmf.fj,tag=!tmf.off.fence_jump,gamemode=!spectator,predicate=tmf:on_ground] at @s if function tmf:fence/facing run function tmf:fence/add
    execute as @a[tag=tmf.fj] at @s unless function tmf:fence/keep run function tmf:fence/remove


    # --- pickup notices / magnet ---
    execute if score #pickup_notices tmf.cfg matches 1 as @a[tag=tmf.invdirty,tag=!tmf.off.pickup_notices] run function tmf:pickup/process
    tag @a[tag=tmf.invdirty] remove tmf.invdirty
    execute as @a[scores={tmf.drop=1..}] at @s run function tmf:magnet/dropped
    execute if score #magnet tmf.cfg matches 1 as @a[tag=tmf.on.magnet,gamemode=!spectator,predicate=!tmf:sneaking] at @s run function tmf:magnet/pull

    # --- damage number animation ---
    execute as @e[type=minecraft:text_display,tag=tmf.dn_new] run function tmf:combat/animate_number

    # --- actionbar cooldown ---
    scoreboard players remove @a[scores={tmf.abt=1..}] tmf.abt 1
""")

fn("loop/t5", """
    schedule function tmf:loop/t5 5t replace
    scoreboard players add #t5 tmf.c 1

    # enderman guard (every 5 ticks, every 20 in performance mode)
    scoreboard players operation #m tmf.tmp = #t5 tmf.c
    scoreboard players operation #m tmf.tmp %= #5 tmf.c
    execute if score #enderman_guard tmf.cfg matches 1 if score #perf tmf.cfg matches 0 run function tmf:enderman/scan
    execute if score #enderman_guard tmf.cfg matches 1 if score #perf tmf.cfg matches 1 if score #m tmf.tmp matches 0 run function tmf:enderman/scan

    # cauldron trash
    execute if score #cauldron_trash tmf.cfg matches 1 if score #perf tmf.cfg matches 0 as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:lava_cauldron run function tmf:trash/burn
    execute if score #cauldron_trash tmf.cfg matches 1 if score #perf tmf.cfg matches 1 if score #m tmf.tmp matches 0 as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:lava_cauldron run function tmf:trash/burn

    # health bars / damage numbers timers
    execute as @e[tag=tmf.hb] run function tmf:combat/hb_tick
    execute as @e[type=minecraft:text_display,tag=tmf.dn] run function tmf:combat/dn_tick

    # HUD + spawn checker (every 10 ticks)
    scoreboard players operation #m2 tmf.tmp = #t5 tmf.c
    scoreboard players operation #m2 tmf.tmp %= #2 tmf.c
    execute if score #coords_hud tmf.cfg matches 1 if score #m2 tmf.tmp matches 0 as @a[tag=tmf.on.coords_hud] unless score @s tmf.abt matches 1.. at @s run function tmf:hud/show
    execute if score #spawn_checker tmf.cfg matches 1 if score #m2 tmf.tmp matches 0 as @a[tag=!tmf.off.spawn_checker,predicate=tmf:sneaking] if items entity @s weapon.mainhand #tmf:torches at @s align xyz positioned ~0.5 ~ ~0.5 run function tmf:spawn/scan

    # breeding info / copper info (4x per second)
    execute if score #breed_info tmf.cfg matches 1 as @a[tag=!tmf.off.breed_info,gamemode=!spectator] if items entity @s weapon.mainhand #tmf:animal_food at @s run function tmf:breed/check
    execute if score #copper_info tmf.cfg matches 1 as @a[tag=!tmf.off.copper_info,gamemode=!spectator,predicate=tmf:sneaking] at @s anchored eyes positioned ^ ^ ^ run function tmf:copper/ray_start

    # fast leaf decay markers
    execute as @e[type=minecraft:marker,tag=tmf.ld] at @s run function tmf:leaves/marker_tick
""")

fn("loop/t20", """
    schedule function tmf:loop/t20 20t replace

    # player position tracker (used by AFK + pet teleport)
    execute as @a at @s run function tmf:player/track

    # AFK sleep percentage
    execute if score #afk tmf.cfg matches 1 run function tmf:afk/update_sleep

    # silence mobs
    execute if score #silence_mobs tmf.cfg matches 1 run function tmf:silence/scan

    # pet guard equipment + owner ids
    execute if score #pet_protect tmf.cfg matches 1.. as @a at @s as @e[type=#tmf:pets,distance=..48,tag=!tmf.pg] run function tmf:pets/equip


    # trader alert, sapling replant, day counter, milestones
    execute if score #trader_alert tmf.cfg matches 1 run function tmf:trader/scan
    execute if score #sapling_replant tmf.cfg matches 1 as @e[type=minecraft:item] if items entity @s contents #minecraft:saplings at @s run function tmf:sapling/check
    execute if score #day_counter tmf.cfg matches 1 run function tmf:day/check
    scoreboard players add #t20 tmf.c 1
    scoreboard players operation #m60 tmf.tmp = #t20 tmf.c
    scoreboard players operation #m60 tmf.tmp %= #60 tmf.c
    execute if score #milestones tmf.cfg matches 1 if score #m60 tmf.tmp matches 0 as @a run function tmf:milestone/check

    # leave detection
    function tmf:join/check_leaves
""")

# ---------------------------------------------------------------------------
# Utilities
# ---------------------------------------------------------------------------
fn("util/show_dialog", "$dialog show @s $(dialog)")
fn("util/actionbar_cd", "scoreboard players set @s tmf.abt 40")

# ---------------------------------------------------------------------------
# 1. Tool auto-swap
# ---------------------------------------------------------------------------
slot_lines = []
for i in range(27):
    slot_lines.append(f'$execute if items entity @s inventory.{i} $(id)[minecraft:damage~{{durability:{{min:3}}}}] run return run function tmf:tool_swap/swap {{slot:"inventory.{i}"}}')
for i in range(9):
    slot_lines.append(f'$execute if items entity @s hotbar.{i} $(id)[minecraft:damage~{{durability:{{min:3}}}}] run return run function tmf:tool_swap/swap {{slot:"hotbar.{i}"}}')
slot_lines.append("return fail")

fn("tool_swap/on_damage", """
    advancement revoke @s only tmf:tool_swap/damaged
    execute unless score #tool_swap tmf.cfg matches 1 run return 0
    execute unless entity @s[tag=tmf.on.tool_swap] run return 0
    execute unless items entity @s weapon.mainhand *[minecraft:damage~{durability:{max:2}}] run return 0
    data modify storage tmf:tmp swap set value {}
    data modify storage tmf:tmp swap.id set from entity @s SelectedItem.id
    execute if function tmf:tool_swap/find run return 1
    # no spare found: warn (once per second at most)
    execute if score @s tmf.swapcd > #tick tmf.c run return 0
    scoreboard players operation @s tmf.swapcd = #tick tmf.c
    scoreboard players add @s tmf.swapcd 20
    function tmf:util/actionbar_cd
    title @s actionbar [{text:"⚠ ",color:"red"},{text:"Your tool is about to break!",color:"gold"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.8 0.6
""")
fn("tool_swap/find", "return run function tmf:tool_swap/find_m with storage tmf:tmp swap")
fn("tool_swap/find_m", "\n".join(slot_lines))
fn("tool_swap/swap", """
    summon minecraft:item_display ~ ~ ~ {Tags:["tmf.swap"]}
    $item replace entity @n[type=minecraft:item_display,tag=tmf.swap] contents from entity @s $(slot)
    $item replace entity @s $(slot) from entity @s weapon.mainhand
    item replace entity @s weapon.mainhand from entity @n[type=minecraft:item_display,tag=tmf.swap] contents
    kill @e[type=minecraft:item_display,tag=tmf.swap]
    function tmf:util/actionbar_cd
    title @s actionbar [{text:"⚒ ",color:"gold"},{text:"Tool swapped – the old one is almost broken",color:"yellow"}]
    playsound minecraft:item.armor.equip_generic player @s ~ ~ ~ 0.7 1.4
    return 1
""")

# ---------------------------------------------------------------------------
# 2. Shulker preview
# ---------------------------------------------------------------------------
fn("shulker/show", """
    execute if score @s tmf.cd > #tick tmf.c run return 0
    scoreboard players operation @s tmf.cd = #tick tmf.c
    scoreboard players add @s tmf.cd 10
    data modify storage tmf:tmp sb set value {items:[],agg:[],lines:[]}
    data modify storage tmf:tmp sb.items set from entity @s SelectedItem.components."minecraft:container"
    execute store result score #slots tmf.tmp run data get storage tmf:tmp sb.items
    execute if score #slots tmf.tmp matches 0 run return run tellraw @s [{text:"📦 ",color:"light_purple"},{text:"This shulker box is empty.",color:"gray"}]
    function tmf:shulker/collect
    function tmf:shulker/build
    tellraw @s [{text:"📦 ",color:"light_purple"},{text:"Shulker box",color:"light_purple",bold:true},{text:" – ",color:"dark_gray"},{score:{name:"#slots",objective:"tmf.tmp"},color:"gray"},{text:"/27 slots used",color:"gray"}]
    tellraw @s [{text:"  "},{nbt:"sb.lines[]",storage:"tmf:tmp",interpret:true,separator:{text:", ",color:"dark_gray"}}]
    playsound minecraft:block.shulker_box.open player @s ~ ~ ~ 0.4 1.6
""")
fn("shulker/collect", """
    data modify storage tmf:tmp sb.cur set from storage tmf:tmp sb.items[0].item
    data remove storage tmf:tmp sb.items[0]
    execute unless data storage tmf:tmp sb.cur.count run data modify storage tmf:tmp sb.cur.count set value 1
    function tmf:shulker/add with storage tmf:tmp sb.cur
    execute if data storage tmf:tmp sb.items[0] run function tmf:shulker/collect
""")
fn("shulker/add", """
    $execute unless data storage tmf:tmp sb.agg[{id:"$(id)"}] run return run data modify storage tmf:tmp sb.agg append value {id:"$(id)",count:$(count)}
    $execute store result score #c tmf.tmp run data get storage tmf:tmp sb.agg[{id:"$(id)"}].count
    $scoreboard players add #c tmf.tmp $(count)
    $execute store result storage tmf:tmp sb.agg[{id:"$(id)"}].count int 1 run scoreboard players get #c tmf.tmp
""")
fn("shulker/build", """
    data modify storage tmf:tmp sb.e set from storage tmf:tmp sb.agg[0]
    data remove storage tmf:tmp sb.agg[0]
    data modify storage tmf:tmp sb.e.p set string storage tmf:tmp sb.e.id 10
    function tmf:shulker/line with storage tmf:tmp sb.e
    execute if data storage tmf:tmp sb.agg[0] run function tmf:shulker/build
""")
fn("shulker/line", """
    $data modify storage tmf:tmp sb.lines append value {text:"",extra:[{text:"$(count)× ",color:"gray"},{translate:"item.minecraft.$(p)",fallback:"%s",with:[{translate:"block.minecraft.$(p)",fallback:"$(p)"}],color:"white"}],hover_event:{action:"show_item",id:"$(id)"}}
""")

# ---------------------------------------------------------------------------
# 3. Death-drop glow
# ---------------------------------------------------------------------------
fn("death_glow/on_death", """
    scoreboard players set @s tmf.deaths 0
    execute unless score #death_glow tmf.cfg matches 1 run return 0
    data modify storage tmf:tmp dg set value {dim:"minecraft:overworld",x:0,y:0,z:0}
    data modify storage tmf:tmp dg.dim set from entity @s LastDeathLocation.dimension
    data modify storage tmf:tmp dg.x set from entity @s LastDeathLocation.pos[0]
    data modify storage tmf:tmp dg.y set from entity @s LastDeathLocation.pos[1]
    data modify storage tmf:tmp dg.z set from entity @s LastDeathLocation.pos[2]
    function tmf:death_glow/apply with storage tmf:tmp dg
""")
fn("death_glow/apply", """
    scoreboard players set #n tmf.tmp 0
    $execute in $(dim) positioned $(x) $(y) $(z) as @e[type=minecraft:item,distance=..8,tag=!tmf.dg] run function tmf:death_glow/mark
    $execute in $(dim) positioned $(x) $(y) $(z) as @e[type=minecraft:experience_orb,distance=..8] run data modify entity @s Glowing set value 1b
    execute if score #n tmf.tmp matches 0 run return 0
    $tellraw @s [{text:"☠ ",color:"red"},{text:"Your ",color:"gray"},{score:{name:"#n",objective:"tmf.tmp"},color:"yellow"},{text:" dropped stacks are glowing at ",color:"gray"},{text:"$(x) $(y) $(z)",color:"yellow",click_event:{action:"copy_to_clipboard",value:"$(x) $(y) $(z)"},hover_event:{action:"show_text",value:"Click to copy"}},{text:" ($(dim)). They stay for 10 minutes.",color:"gray"}]
""")
fn("death_glow/mark", """
    data merge entity @s {Glowing:1b,Age:-6000s}
    tag @s add tmf.dg
    scoreboard players add #n tmf.tmp 1
""")

# ---------------------------------------------------------------------------
# 4. Faster paths
# ---------------------------------------------------------------------------
fn("paths/on_path", """
    execute if block ~ ~ ~ minecraft:dirt_path run return 1
    execute if block ~ ~-0.2 ~ minecraft:dirt_path run return 1
    return fail
""")
fn("paths/keep", """
    execute unless score #fast_paths tmf.cfg matches 1 run return fail
    execute if entity @s[tag=tmf.off.fast_paths] run return fail
    execute if entity @s[gamemode=spectator] run return fail
    execute if function tmf:paths/on_path run return 1
    # keep the bonus while jumping
    execute unless entity @s[predicate=tmf:on_ground] run return 1
    return fail
""")
fn("paths/add", """
    attribute @s minecraft:movement_speed modifier add tmf:fast_path 0.3 add_multiplied_base
    tag @s add tmf.onpath
""")
fn("paths/remove", """
    attribute @s minecraft:movement_speed modifier remove tmf:fast_path
    tag @s remove tmf.onpath
""")

# ---------------------------------------------------------------------------
# 5. Horse stats
# ---------------------------------------------------------------------------
fn("horse/interact", """
    advancement revoke @s only tmf:horse_stats/interact
    execute unless score #horse_stats tmf.cfg matches 1 run return 0
    execute if entity @s[tag=tmf.off.horse_stats] run return 0
    tag @s add tmf.hs_player
    scoreboard players set #found tmf.tmp 0
    execute as @e[type=#tmf:horses,distance=..10] run function tmf:horse/candidate
    execute if score #found tmf.tmp matches 0 as @e[type=#tmf:horses,distance=..6,sort=nearest,limit=1] run function tmf:horse/show
    tag @s remove tmf.hs_player
""")
fn("horse/candidate", """
    execute if score #found tmf.tmp matches 1 run return 0
    tag @s add tmf.hs_cand
    execute if entity @a[tag=tmf.hs_player,limit=1,predicate=tmf:looking_at_candidate] run function tmf:horse/show
    tag @s remove tmf.hs_cand
""")
fn("horse/show", """
    scoreboard players set #found tmf.tmp 1
    # speed in blocks/s x10  (movement_speed * 42.16)
    execute store result score #spd tmf.tmp run attribute @s minecraft:movement_speed base get 1000
    scoreboard players operation #spdp tmf.tmp = #spd tmf.tmp
    scoreboard players operation #spd tmf.tmp *= #4216 tmf.c
    scoreboard players operation #spd tmf.tmp /= #10000 tmf.c
    scoreboard players operation #spdi tmf.tmp = #spd tmf.tmp
    scoreboard players operation #spdi tmf.tmp /= #10 tmf.c
    scoreboard players operation #spdd tmf.tmp = #spd tmf.tmp
    scoreboard players operation #spdd tmf.tmp %= #10 tmf.c
    # speed percentage of the possible range (0.1125 .. 0.3375)
    scoreboard players remove #spdp tmf.tmp 112
    scoreboard players operation #spdp tmf.tmp *= #100 tmf.c
    scoreboard players set #div tmf.tmp 225
    scoreboard players operation #spdp tmf.tmp /= #div tmf.tmp
    execute if score #spdp tmf.tmp matches ..-1 run scoreboard players set #spdp tmf.tmp 0
    execute if score #spdp tmf.tmp matches 101.. run scoreboard players set #spdp tmf.tmp 100

    # jump height (blocks x10) from jump_strength
    execute store result score #x tmf.tmp run attribute @s minecraft:jump_strength base get 1000
    scoreboard players operation #jp tmf.tmp = #x tmf.tmp
    scoreboard players operation #x2 tmf.tmp = #x tmf.tmp
    scoreboard players operation #x2 tmf.tmp *= #x tmf.tmp
    scoreboard players operation #x2 tmf.tmp /= #1000 tmf.c
    scoreboard players operation #x3 tmf.tmp = #x2 tmf.tmp
    scoreboard players operation #x3 tmf.tmp *= #x tmf.tmp
    scoreboard players operation #x3 tmf.tmp /= #1000 tmf.c
    scoreboard players set #k tmf.tmp -1818
    scoreboard players operation #x3 tmf.tmp *= #k tmf.tmp
    scoreboard players set #k tmf.tmp 36897
    scoreboard players operation #x2 tmf.tmp *= #k tmf.tmp
    scoreboard players set #k tmf.tmp 21286
    scoreboard players operation #x tmf.tmp *= #k tmf.tmp
    scoreboard players operation #jmp tmf.tmp = #x3 tmf.tmp
    scoreboard players operation #jmp tmf.tmp += #x2 tmf.tmp
    scoreboard players operation #jmp tmf.tmp += #x tmf.tmp
    scoreboard players remove #jmp tmf.tmp 3439304
    scoreboard players set #k tmf.tmp 1000000
    scoreboard players operation #jmp tmf.tmp /= #k tmf.tmp
    execute if score #jmp tmf.tmp matches ..-1 run scoreboard players set #jmp tmf.tmp 0
    scoreboard players operation #jmpi tmf.tmp = #jmp tmf.tmp
    scoreboard players operation #jmpi tmf.tmp /= #10 tmf.c
    scoreboard players operation #jmpd tmf.tmp = #jmp tmf.tmp
    scoreboard players operation #jmpd tmf.tmp %= #10 tmf.c
    # jump percentage of the possible range (0.4 .. 1.0)
    scoreboard players remove #jp tmf.tmp 400
    scoreboard players operation #jp tmf.tmp *= #100 tmf.c
    scoreboard players set #div tmf.tmp 600
    scoreboard players operation #jp tmf.tmp /= #div tmf.tmp
    execute if score #jp tmf.tmp matches ..-1 run scoreboard players set #jp tmf.tmp 0
    execute if score #jp tmf.tmp matches 101.. run scoreboard players set #jp tmf.tmp 100

    # health
    execute store result score #hp tmf.tmp run data get entity @s Health
    execute store result score #mhp tmf.tmp run attribute @s minecraft:max_health get
    scoreboard players operation #hpp tmf.tmp = #mhp tmf.tmp
    scoreboard players remove #hpp tmf.tmp 15
    scoreboard players operation #hpp tmf.tmp *= #100 tmf.c
    scoreboard players set #div tmf.tmp 15
    scoreboard players operation #hpp tmf.tmp /= #div tmf.tmp
    execute if score #hpp tmf.tmp matches ..-1 run scoreboard players set #hpp tmf.tmp 0
    execute if score #hpp tmf.tmp matches 101.. run scoreboard players set #hpp tmf.tmp 100

    tellraw @a[tag=tmf.hs_player] [{text:"🐴 ",color:"gold"},{selector:"@s",color:"gold",bold:true},{text:" stats",color:"gold"}]
    tellraw @a[tag=tmf.hs_player] [{text:"  Speed: ",color:"gray"},{score:{name:"#spdi",objective:"tmf.tmp"},color:"white"},{text:".",color:"white"},{score:{name:"#spdd",objective:"tmf.tmp"},color:"white"},{text:" blocks/s ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#spdp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
    tellraw @a[tag=tmf.hs_player] [{text:"  Jump: ",color:"gray"},{score:{name:"#jmpi",objective:"tmf.tmp"},color:"white"},{text:".",color:"white"},{score:{name:"#jmpd",objective:"tmf.tmp"},color:"white"},{text:" blocks ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#jp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
    tellraw @a[tag=tmf.hs_player] [{text:"  Health: ",color:"gray"},{score:{name:"#hp",objective:"tmf.tmp"},color:"white"},{text:"/",color:"white"},{score:{name:"#mhp",objective:"tmf.tmp"},color:"white"},{text:" HP ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#hpp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
    execute on owner run tellraw @a[tag=tmf.hs_player] [{text:"  Owner: ",color:"gray"},{selector:"@s",color:"white"}]
""")

# ---------------------------------------------------------------------------
# 6. Pet protection (uses the tmf:pet_guard enchantment on a hidden feet item)
# ---------------------------------------------------------------------------
fn("pets/equip", """
    tag @s add tmf.pp_self
    execute on owner run scoreboard players operation @e[tag=tmf.pp_self,limit=1] tmf.oid = @s tmf.id
    tag @s remove tmf.pp_self
    execute unless score @s tmf.oid matches 1.. run return 0
    execute if items entity @s armor.feet * run return run tag @s add tmf.pg
    item replace entity @s armor.feet with minecraft:barrier[minecraft:enchantments={"tmf:pet_guard":1},minecraft:custom_data={tmf_pet_guard:1b}]
    data modify entity @s drop_chances.feet set value 0.0f
    tag @s add tmf.pg
""")
fn("pets/unequip", """
    execute if items entity @s armor.feet minecraft:barrier[minecraft:custom_data~{tmf_pet_guard:1b}] run item replace entity @s armor.feet with minecraft:air
    tag @s remove tmf.pg
""")

# ---------------------------------------------------------------------------
# 7. No phantoms – handled by config/apply (gamerule)
# 8. Enderman anti-grief
# ---------------------------------------------------------------------------
fn("enderman/scan", """
    execute as @e[type=minecraft:enderman] unless data entity @s carriedBlockState at @s run function tmf:enderman/give_dummy
""")
fn("enderman/give_dummy", """
    # an enderman that was holding our invisible dummy put it down: clean it up
    execute if entity @s[tag=tmf.eg] run fill ~-2 ~-1 ~-2 ~2 ~3 ~2 minecraft:air replace minecraft:structure_void
    data modify entity @s carriedBlockState set value {id:"minecraft:structure_void"}
    tag @s add tmf.eg
""")
fn("enderman/strip_all", """
    execute as @e[type=minecraft:enderman,tag=tmf.eg] run function tmf:enderman/strip
""")
fn("enderman/strip", """
    execute if data entity @s {carriedBlockState:"minecraft:structure_void"} run data remove entity @s carriedBlockState
    execute if data entity @s {carriedBlockState:{id:"minecraft:structure_void"}} run data remove entity @s carriedBlockState
    tag @s remove tmf.eg
""")

# ---------------------------------------------------------------------------
# 9. Silence mobs
# ---------------------------------------------------------------------------
NAMES = ["Silence", "silence", "Quiet", "quiet", "Shh", "shh", "Silent", "silent"]
fn("silence/scan", "\n".join(
    [f'execute as @e[type=!minecraft:player,tag=!tmf.silenced,name={n}] run function tmf:silence/on' for n in NAMES] +
    ['execute as @e[tag=tmf.silenced] unless function tmf:silence/has_name run function tmf:silence/off']))
fn("silence/has_name", "\n".join([f"execute if entity @s[name={n}] run return 1" for n in NAMES] + ["return fail"]))
fn("silence/on", """
    data modify entity @s Silent set value 1b
    tag @s add tmf.silenced
    execute at @s run particle minecraft:note ~ ~1.5 ~ 0.2 0.2 0.2 0 3
""")
fn("silence/off", """
    data modify entity @s Silent set value 0b
    tag @s remove tmf.silenced
""")
fn("silence/off_all", "execute as @e[tag=tmf.silenced] run function tmf:silence/off")

# ---------------------------------------------------------------------------
# Player tracker (position, rotation, dimension once a second)
# ---------------------------------------------------------------------------
fn("player/track", """
    data modify storage tmf:tmp pt set value {}
    data modify storage tmf:tmp pt.pos set from entity @s Pos
    data modify storage tmf:tmp pt.rot set from entity @s Rotation
    execute store result score #x tmf.tmp run data get storage tmf:tmp pt.pos[0] 10
    execute store result score #y tmf.tmp run data get storage tmf:tmp pt.pos[1] 10
    execute store result score #z tmf.tmp run data get storage tmf:tmp pt.pos[2] 10
    execute store result score #rx tmf.tmp run data get storage tmf:tmp pt.rot[0]
    execute store result score #ry tmf.tmp run data get storage tmf:tmp pt.rot[1]
    scoreboard players set #dim tmf.tmp 3
    execute if dimension minecraft:overworld run scoreboard players set #dim tmf.tmp 0
    execute if dimension minecraft:the_nether run scoreboard players set #dim tmf.tmp 1
    execute if dimension minecraft:the_end run scoreboard players set #dim tmf.tmp 2

    execute if score #afk tmf.cfg matches 1 run function tmf:afk/check

    scoreboard players operation @s tmf.px = #x tmf.tmp
    scoreboard players operation @s tmf.py = #y tmf.tmp
    scoreboard players operation @s tmf.pz = #z tmf.tmp
    scoreboard players operation @s tmf.rx = #rx tmf.tmp
    scoreboard players operation @s tmf.ry = #ry tmf.tmp
    scoreboard players operation @s tmf.dim = #dim tmf.tmp
""")

# ---------------------------------------------------------------------------
# 10. Pet teleport
# ---------------------------------------------------------------------------
fn("pets/dim_change", """
    advancement revoke @s only tmf:pets/changed_dimension
    execute unless score #pet_teleport tmf.cfg matches 1 run return 0
    execute if entity @s[tag=tmf.off.pet_teleport] run return 0
    execute unless score @s tmf.dim matches 0..3 run return 0
    tag @s add tmf.pt_owner
    scoreboard players set #n tmf.tmp 0
    data modify storage tmf:tmp ptp set value {dim:"minecraft:overworld"}
    execute if score @s tmf.dim matches 1 run data modify storage tmf:tmp ptp.dim set value "minecraft:the_nether"
    execute if score @s tmf.dim matches 2 run data modify storage tmf:tmp ptp.dim set value "minecraft:the_end"
    execute store result storage tmf:tmp ptp.x double 0.1 run scoreboard players get @s tmf.px
    execute store result storage tmf:tmp ptp.y double 0.1 run scoreboard players get @s tmf.py
    execute store result storage tmf:tmp ptp.z double 0.1 run scoreboard players get @s tmf.pz
    execute if score @s tmf.dim matches 0..2 run function tmf:pets/gather with storage tmf:tmp ptp
    execute if score #n tmf.tmp matches 1.. run tellraw @s [{text:"🐾 ",color:"aqua"},{score:{name:"#n",objective:"tmf.tmp"},color:"white"},{text:" of your pets followed you.",color:"gray"}]
    tag @s remove tmf.pt_owner
""")
fn("pets/gather", """
    $execute in $(dim) positioned $(x) $(y) $(z) as @e[type=#tmf:followers,distance=..32] unless data entity @s {Sitting:1b} unless function tmf:pets/leashed if function tmf:pets/owned_by_traveller run function tmf:pets/bring
""")
fn("pets/leashed", """
    execute on leasher run return 1
    execute on vehicle run return 1
    return fail
""")
fn("pets/owned_by_traveller", """
    execute on owner if entity @s[tag=tmf.pt_owner] run return 1
    return fail
""")
fn("pets/bring", """
    tp @s @a[tag=tmf.pt_owner,limit=1]
    scoreboard players add #n tmf.tmp 1
""")

# ---------------------------------------------------------------------------
# Click overlays (interaction entities placed over ladders / enchanting tables)
# ---------------------------------------------------------------------------
fn("overlay/tick", """
    # left-clicks on overlays
    execute as @e[type=minecraft:interaction,tag=tmf.ov] if data entity @s attack at @s run function tmf:overlay/on_attack
    tag @e[type=minecraft:interaction,tag=tmf.ov] add tmf.ov_stale
    execute if score #ladder_drop tmf.cfg matches 1 as @a[tag=!tmf.off.ladder_drop,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] if items entity @s weapon.mainhand minecraft:ladder at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"ladder"}
    execute if score #harvest tmf.cfg matches 1 as @a[tag=!tmf.off.harvest,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] unless items entity @s weapon.mainhand minecraft:ladder at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"harvest"}
    # Tool Auto-Swap: while mining, swap as soon as you look at a block that needs another tool (tunnelling)
    execute if score #best_tool tmf.cfg matches 1 as @a[tag=tmf.on.best_tool,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] if score @s tmf.mine > #tick tmf.c unless score @s tmf.fight > #tick tmf.c if items entity @s weapon.mainhand #tmf:tools at @s anchored eyes positioned ^ ^ ^ run function tmf:bt/mine_ray_start
    # ...and when not mining yet, catch the first left-click on such a block
    execute if score #best_tool tmf.cfg matches 1 as @a[tag=tmf.on.best_tool,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] unless score @s tmf.mine > #tick tmf.c unless score @s tmf.fight > #tick tmf.c unless score @s tmf.btsup > #tick tmf.c if items entity @s weapon.mainhand #tmf:tools at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"bt"}
    kill @e[type=minecraft:interaction,tag=tmf.ov_stale]
""")
fn("overlay/ray_start", """
    scoreboard players set #r tmf.tmp 0
    $function tmf:overlay/ray_$(type)
""")
fn("overlay/ray_ladder", """
    execute if block ~ ~ ~ minecraft:ladder align xyz unless entity @s[dx=0,dy=0,dz=0] positioned ~0.5 ~ ~0.5 run return run function tmf:overlay/ensure {type:"ladder",h:1.0,w:1.01}
    execute unless block ~ ~ ~ #tmf:ray_pass run return fail
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..29 positioned ^ ^ ^0.1 run function tmf:overlay/ray_ladder
""")
fn("overlay/ray_harvest", """
    execute if block ~ ~ ~ #tmf:harvestable align xyz if function tmf:harvest/is_mature unless entity @s[dx=0,dy=0,dz=0] positioned ~0.5 ~ ~0.5 run return run function tmf:overlay/ensure {type:"harvest",h:1.0,w:1.01}
    execute unless block ~ ~ ~ #tmf:ray_pass run return fail
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..29 positioned ^ ^ ^0.1 run function tmf:overlay/ray_harvest
""")
fn("overlay/ray_bt", """
    execute unless block ~ ~ ~ #tmf:ray_pass unless block ~ ~ ~ #tmf:bt_skip align xyz unless entity @s[dx=0,dy=0,dz=0] if function tmf:bt/needs_swap positioned ~0.5 ~ ~0.5 run return run function tmf:overlay/ensure {type:"bt",h:1.0,w:1.01}
    execute unless block ~ ~ ~ #tmf:ray_pass run return fail
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..29 positioned ^ ^ ^0.1 run function tmf:overlay/ray_bt
""")
fn("overlay/ensure", """
    $tag @e[type=minecraft:interaction,tag=tmf.ov.$(type),distance=..0.01] remove tmf.ov_stale
    $execute unless entity @e[type=minecraft:interaction,tag=tmf.ov.$(type),distance=..0.01] run summon minecraft:interaction ~ ~ ~ {width:$(w)f,height:$(h)f,response:1b,Tags:["tmf.ov","tmf.ov.$(type)"]}
    return 1
""")
fn("overlay/on_click", """
    advancement revoke @s only tmf:overlay/click
    tag @s add tmf.clicker
    execute as @e[type=minecraft:interaction,tag=tmf.ov,distance=..6] if function tmf:overlay/clicked_by_me at @s run function tmf:overlay/handle
    tag @s remove tmf.clicker
""")
fn("overlay/clicked_by_me", """
    execute on target if entity @s[tag=tmf.clicker] run return 1
    return fail
""")
fn("overlay/handle", """
    data remove entity @s interaction
    execute if entity @s[tag=tmf.ov.ladder] as @a[tag=tmf.clicker,limit=1] run function tmf:ladder/drop
    execute if entity @s[tag=tmf.ov.harvest] as @a[tag=tmf.clicker,limit=1] run function tmf:harvest/right_click
    # right-click on a Tool Auto-Swap overlay: get out of the way for 2 seconds
    execute if entity @s[tag=tmf.ov.bt] as @a[tag=tmf.clicker,limit=1] run function tmf:bt/suppress
    execute if entity @s[tag=tmf.ov.bt] run kill @s
""")
fn("overlay/on_attack", """
    data remove entity @s attack
    execute if entity @s[tag=tmf.ov.ladder] on attacker run function tmf:ladder/break
    execute if entity @s[tag=tmf.ov.harvest] on attacker run function tmf:harvest/left_click
    execute if entity @s[tag=tmf.ov.bt] on attacker run function tmf:bt/swap_now
    execute if entity @s[tag=tmf.ov.bt] run kill @s
""")

# ---------------------------------------------------------------------------
# 11. Ladder dropping
# ---------------------------------------------------------------------------
fn("ladder/break", """
    execute unless entity @s[gamemode=creative] run setblock ~ ~ ~ minecraft:air destroy
    execute if entity @s[gamemode=creative] run setblock ~ ~ ~ minecraft:air
    playsound minecraft:block.ladder.break block @a ~ ~ ~ 1 1
""")
fn("ladder/drop", """
    scoreboard players set #d tmf.tmp 0
    function tmf:ladder/descend
""")
fn("ladder/descend", """
    scoreboard players add #d tmf.tmp 1
    execute if score #d tmf.tmp matches 400.. run return fail
    execute if block ~ ~-1 ~ minecraft:ladder positioned ~ ~-1 ~ run return run function tmf:ladder/descend
    execute positioned ~ ~-1 ~ run function tmf:ladder/place
""")
LADDER_SUPPORT = {"north": "~ ~ ~1", "south": "~ ~ ~-1", "east": "~-1 ~ ~", "west": "~1 ~ ~"}
fn("ladder/place", "\n".join([
    'execute unless block ~ ~ ~ #tmf:ladder_space run return run function tmf:ladder/blocked',
] + [f'execute if block ~ ~1 ~ minecraft:ladder[facing={f}] run return run function tmf:ladder/set {{f:"{f}"}}'
     for f in LADDER_SUPPORT]))
fn("ladder/blocked", """
    function tmf:util/actionbar_cd
    title @s actionbar {text:"The bottom of this ladder is blocked.",color:"red"}
""")
fn("ladder/set", """
    $execute if block ~ ~ ~ minecraft:water[level=0] run setblock ~ ~ ~ minecraft:ladder[facing=$(f),waterlogged=true]
    $execute unless block ~ ~ ~ minecraft:ladder run setblock ~ ~ ~ minecraft:ladder[facing=$(f)]
    playsound minecraft:block.ladder.place block @a ~ ~ ~ 1 1
    execute unless entity @s[gamemode=creative] run clear @s minecraft:ladder 1
    swing @s mainhand
""")

# ---------------------------------------------------------------------------
# 12. Double doors
# ---------------------------------------------------------------------------
for state, word in (("true", "opened"), ("false", "closed")):
    for half in ("", "_upper"):
        fn(f"doors/{word}{half}", f"""
            advancement revoke @s only tmf:doors/{word}{half}
            execute unless score #double_doors tmf.cfg matches 1 run return 0
            execute if entity @s[tag=tmf.off.double_doors] run return 0
            execute if entity @s[predicate=tmf:sneaking] run return 0
            data modify storage tmf:tmp door set value {{open:"{state}"}}
            scoreboard players set #r tmf.tmp 0
            execute at @s anchored eyes positioned ^ ^ ^ run function tmf:doors/ray
        """)
fn("doors/ray", """
    execute if block ~ ~ ~ #tmf:doors align xyz run return run function tmf:doors/found
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..60 positioned ^ ^ ^0.1 run function tmf:doors/ray
""")
fn("doors/found", """
    execute if block ~ ~ ~ #tmf:doors[half=upper] positioned ~ ~-1 ~ run return run function tmf:doors/at_lower
    function tmf:doors/at_lower
""")
PARTNER = {  # (facing, hinge) -> offset of the partner door
    ("north", "left"): "~1 ~ ~", ("east", "left"): "~ ~ ~1", ("south", "left"): "~-1 ~ ~", ("west", "left"): "~ ~ ~-1",
    ("north", "right"): "~-1 ~ ~", ("east", "right"): "~ ~ ~-1", ("south", "right"): "~1 ~ ~", ("west", "right"): "~ ~ ~1",
}
lines = ["# make the found door match the new state (in case the ray hit the partner first)",
         "function tmf:doors/set_here with storage tmf:tmp door"]
for (facing, hinge), off in PARTNER.items():
    other = "right" if hinge == "left" else "left"
    lines.append(f"execute if block ~ ~ ~ #tmf:doors[facing={facing},hinge={hinge}] positioned {off} if block ~ ~ ~ #tmf:doors[facing={facing},hinge={other},half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door")
fn("doors/at_lower", "\n".join(lines))
door_id_lines = [f'execute if block ~ ~ ~ minecraft:{d} run data modify storage tmf:tmp dset.id set value "minecraft:{d}"' for d in DOORS]
fn("doors/set_here", "\n".join([
    "$execute if block ~ ~ ~ #tmf:doors[open=$(open)] run return 0",
    "$data modify storage tmf:tmp dset set value {open:\"$(open)\",id:\"\",facing:\"north\",hinge:\"left\",powered:\"false\"}",
] + door_id_lines + [
    'execute if block ~ ~ ~ #tmf:doors[facing=south] run data modify storage tmf:tmp dset.facing set value "south"',
    'execute if block ~ ~ ~ #tmf:doors[facing=east] run data modify storage tmf:tmp dset.facing set value "east"',
    'execute if block ~ ~ ~ #tmf:doors[facing=west] run data modify storage tmf:tmp dset.facing set value "west"',
    'execute if block ~ ~ ~ #tmf:doors[hinge=right] run data modify storage tmf:tmp dset.hinge set value "right"',
    'execute if block ~ ~ ~ #tmf:doors[powered=true] run data modify storage tmf:tmp dset.powered set value "true"',
    'execute if data storage tmf:tmp dset{id:""} run return 0',
    'function tmf:doors/apply with storage tmf:tmp dset',
]))
fn("doors/apply", """
    $setblock ~ ~ ~ $(id)[half=lower,facing=$(facing),hinge=$(hinge),open=$(open),powered=$(powered)]
    $setblock ~ ~1 ~ $(id)[half=upper,facing=$(facing),hinge=$(hinge),open=$(open),powered=$(powered)]
""")

# ---------------------------------------------------------------------------
# 13. Cauldron trash
# ---------------------------------------------------------------------------
fn("trash/burn", """
    particle minecraft:lava ~ ~0.5 ~ 0.1 0.1 0.1 0 4
    particle minecraft:large_smoke ~ ~0.7 ~ 0.1 0.1 0.1 0.01 3
    playsound minecraft:block.lava.extinguish block @a ~ ~ ~ 0.6 1.2
    kill @s
""")

# ---------------------------------------------------------------------------
# 14 + 15. Health bars & damage numbers
# ---------------------------------------------------------------------------
fn("combat/on_hurt", """
    scoreboard players operation @s tmf.fight = #tick tmf.c
    scoreboard players add @s tmf.fight 60
    scoreboard players set @s tmf.mine 0
    execute unless score #perf tmf.cfg matches 0 run return 0
    execute if score #health_bars tmf.cfg matches 0 if score #damage_numbers tmf.cfg matches 0 run return 0
    scoreboard players set #found tmf.tmp 0
    execute as @e[type=!#tmf:no_bar,distance=..64,nbt={HurtTime:10s},sort=nearest] unless score @s tmf.hitt = #tick tmf.c at @s run function tmf:combat/process
    # killing blow: the mob is already gone, show the number where the player is looking
    execute if score #found tmf.tmp matches 0 if score #damage_numbers tmf.cfg matches 1 if score #dmg tmf.tmp matches 1.. at @s anchored eyes positioned ^ ^-0.3 ^2 run function tmf:combat/number {color:"red",suffix:" ☠"}
""")
fn("combat/process", """
    execute if score #found tmf.tmp matches 1 run return 0
    scoreboard players set #found tmf.tmp 1
    scoreboard players operation @s tmf.hitt = #tick tmf.c
    execute if score #damage_numbers tmf.cfg matches 1 if score #dmg tmf.tmp matches 1.. anchored eyes positioned ^ ^0.5 ^ run function tmf:combat/number {color:"gold",suffix:""}
    execute if score #health_bars tmf.cfg matches 1 run function tmf:combat/health_bar
""")
fn("combat/number", """
    data modify storage tmf:tmp dn set value {i:0,d:0}
    $data modify storage tmf:tmp dn.color set value "$(color)"
    $data modify storage tmf:tmp dn.suffix set value "$(suffix)"
    scoreboard players operation #di tmf.tmp = #dmg tmf.tmp
    scoreboard players operation #di tmf.tmp /= #10 tmf.c
    scoreboard players operation #dd tmf.tmp = #dmg tmf.tmp
    scoreboard players operation #dd tmf.tmp %= #10 tmf.c
    execute store result storage tmf:tmp dn.i int 1 run scoreboard players get #di tmf.tmp
    execute store result storage tmf:tmp dn.d int 1 run scoreboard players get #dd tmf.tmp
    execute if score #dmg tmf.tmp matches 999 run return run function tmf:combat/spawn_number {txt:"60+",color:"dark_red",suffix:""}
    function tmf:combat/number_txt with storage tmf:tmp dn
""")
fn("combat/number_txt", """
    $function tmf:combat/spawn_number {txt:"$(i).$(d)",color:"$(color)",suffix:"$(suffix)"}
""")
fn("combat/spawn_number", """
    $summon minecraft:text_display ~ ~ ~ {billboard:"center",Tags:["tmf.dn","tmf.dn_new"],text:{text:"$(txt)$(suffix)",color:"$(color)",bold:true},background:0,shadow:1b,brightness:{sky:15,block:15},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f]}}
    scoreboard players set @e[type=minecraft:text_display,tag=tmf.dn_new,distance=..0.1] tmf.dnt 0
""")
fn("combat/animate_number", """
    tag @s remove tmf.dn_new
    data merge entity @s {start_interpolation:0,interpolation_duration:18,transformation:{translation:[0f,0.8f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f]}}
""")
fn("combat/dn_tick", """
    scoreboard players add @s tmf.dnt 5
    execute if score @s tmf.dnt matches 20.. run kill @s
""")
fn("combat/health_bar", """
    # never overwrite a real name
    execute if data entity @s CustomName unless entity @s[tag=tmf.hb] run return 0
    execute store result score #hp tmf.tmp run data get entity @s Health 10
    execute store result score #max tmf.tmp run attribute @s minecraft:max_health get 10
    execute if score #max tmf.tmp matches ..0 run return 0
    # segments (0..10), rounded up
    scoreboard players operation #seg tmf.tmp = #hp tmf.tmp
    scoreboard players operation #seg tmf.tmp *= #10 tmf.c
    scoreboard players operation #seg tmf.tmp += #max tmf.tmp
    scoreboard players remove #seg tmf.tmp 1
    scoreboard players operation #seg tmf.tmp /= #max tmf.tmp
    execute if score #seg tmf.tmp matches 11.. run scoreboard players set #seg tmf.tmp 10
    execute if score #seg tmf.tmp matches ..-1 run scoreboard players set #seg tmf.tmp 0
    data modify storage tmf:tmp hb set value {}
    execute store result storage tmf:tmp hb.seg int 1 run scoreboard players get #seg tmf.tmp
    scoreboard players operation #hi tmf.tmp = #hp tmf.tmp
    scoreboard players operation #hi tmf.tmp /= #10 tmf.c
    scoreboard players operation #hd tmf.tmp = #hp tmf.tmp
    scoreboard players operation #hd tmf.tmp %= #10 tmf.c
    scoreboard players operation #mi tmf.tmp = #max tmf.tmp
    scoreboard players operation #mi tmf.tmp /= #10 tmf.c
    execute store result storage tmf:tmp hb.hi int 1 run scoreboard players get #hi tmf.tmp
    execute store result storage tmf:tmp hb.hd int 1 run scoreboard players get #hd tmf.tmp
    execute store result storage tmf:tmp hb.mi int 1 run scoreboard players get #mi tmf.tmp
    function tmf:combat/bar_lookup with storage tmf:tmp hb
    function tmf:combat/bar_name with storage tmf:tmp hb
    data modify entity @s CustomNameVisible set value 1b
    tag @s add tmf.hb
    scoreboard players set @s tmf.hbt 60
""")
fn("combat/bar_lookup", """
    $data modify storage tmf:tmp hb.f set from storage tmf:data bars[$(seg)].f
    $data modify storage tmf:tmp hb.e set from storage tmf:data bars[$(seg)].e
    $data modify storage tmf:tmp hb.c set from storage tmf:data bars[$(seg)].c
""")
fn("combat/bar_name", """
    $data modify entity @s CustomName set value {text:"",extra:[{text:"$(f)",color:"$(c)"},{text:"$(e)",color:"dark_gray"},{text:" $(hi).$(hd)",color:"white"},{text:"/$(mi)",color:"gray"},{text:" ❤",color:"red"}]}
""")
fn("combat/hb_tick", """
    scoreboard players remove @s tmf.hbt 5
    execute if score @s tmf.hbt matches ..0 run function tmf:combat/hb_clear
""")
fn("combat/hb_clear", """
    data remove entity @s CustomName
    data modify entity @s CustomNameVisible set value 0b
    tag @s remove tmf.hb
    scoreboard players reset @s tmf.hbt
    scoreboard players reset @s tmf.hitt
""")
fn("combat/clear_all", """
    execute as @e[tag=tmf.hb] run function tmf:combat/hb_clear
    kill @e[type=minecraft:text_display,tag=tmf.dn]
""")

# ---------------------------------------------------------------------------
# Coordinates HUD
# ---------------------------------------------------------------------------
fn("hud/show", """
    data modify storage tmf:tmp hud set value []
    execute if score #coords_hud tmf.cfg matches 1 if entity @s[tag=tmf.on.coords_hud] run function tmf:hud/coords
    execute unless data storage tmf:tmp hud[0] run return 0
    title @s actionbar {nbt:"hud[]",storage:"tmf:tmp",interpret:true,separator:{text:"   │   ",color:"dark_gray"}}
""")
DIRS = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]
fn("hud/coords", "\n".join([
    "data modify storage tmf:tmp hc set value {x:0,y:0,z:0,d:\"?\",b:\"plains\"}",
    "data modify storage tmf:tmp hc.pos set from entity @s Pos",
    "execute store result score #x tmf.tmp run data get storage tmf:tmp hc.pos[0] 10",
    "execute store result score #y tmf.tmp run data get storage tmf:tmp hc.pos[1] 10",
    "execute store result score #z tmf.tmp run data get storage tmf:tmp hc.pos[2] 10",
    "scoreboard players operation #x tmf.tmp /= #10 tmf.c",
    "scoreboard players operation #y tmf.tmp /= #10 tmf.c",
    "scoreboard players operation #z tmf.tmp /= #10 tmf.c",
    "execute store result storage tmf:tmp hc.x int 1 run scoreboard players get #x tmf.tmp",
    "execute store result storage tmf:tmp hc.y int 1 run scoreboard players get #y tmf.tmp",
    "execute store result storage tmf:tmp hc.z int 1 run scoreboard players get #z tmf.tmp",
    "execute store result score #yaw tmf.tmp run data get entity @s Rotation[0] 10",
    "scoreboard players add #yaw tmf.tmp 225",
    "scoreboard players set #k tmf.tmp 3600",
    "scoreboard players operation #yaw tmf.tmp %= #k tmf.tmp",
    "scoreboard players set #k tmf.tmp 450",
    "scoreboard players operation #yaw tmf.tmp /= #k tmf.tmp",
] + [f'execute if score #yaw tmf.tmp matches {i} run data modify storage tmf:tmp hc.d set value "{d}"' for i, d in enumerate(DIRS)] + [
    "function tmf:hud/coords_m with storage tmf:tmp hc",
]))
fn("hud/coords_m", """
    $data modify storage tmf:tmp hud append value {text:"",color:"gray",extra:[{text:"$(x) $(y) $(z)"},{text:"  $(d)",color:"dark_gray"}]}
""")

# ---------------------------------------------------------------------------
# 18. AFK detection
# ---------------------------------------------------------------------------
fn("afk/check", """
    scoreboard players set #moved tmf.tmp 0
    execute unless score @s tmf.px = #x tmf.tmp run scoreboard players set #moved tmf.tmp 1
    execute unless score @s tmf.py = #y tmf.tmp run scoreboard players set #moved tmf.tmp 1
    execute unless score @s tmf.pz = #z tmf.tmp run scoreboard players set #moved tmf.tmp 1
    execute unless score @s tmf.rx = #rx tmf.tmp run scoreboard players set #moved tmf.tmp 1
    execute unless score @s tmf.ry = #ry tmf.tmp run scoreboard players set #moved tmf.tmp 1
    execute if score #moved tmf.tmp matches 1 run scoreboard players set @s tmf.afk 0
    execute if score #moved tmf.tmp matches 1 if entity @s[tag=tmf.afk] run function tmf:afk/back
    execute if score #moved tmf.tmp matches 1 run return 0
    scoreboard players add @s tmf.afk 1
    scoreboard players operation #lim tmf.tmp = #afk_min tmf.cfg
    scoreboard players operation #lim tmf.tmp *= #60 tmf.c
    execute if entity @s[tag=!tmf.afk] if score @s tmf.afk >= #lim tmf.tmp run function tmf:afk/go
""")
fn("afk/go", """
    tag @s add tmf.afk
    execute if entity @s[team=] run team join tmf.afk @s
    tellraw @a [{text:"💤 ",color:"gray"},{selector:"@s",color:"gray"},{text:" is now AFK",color:"gray",italic:true}]
""")
fn("afk/back", """
    tag @s remove tmf.afk
    execute if entity @s[team=tmf.afk] run team leave @s
    tellraw @a [{text:"☀ ",color:"yellow"},{selector:"@s",color:"gray"},{text:" is no longer AFK",color:"gray",italic:true}]
""")
fn("afk/clear_all", """
    execute as @a[tag=tmf.afk] run tag @s remove tmf.afk
    execute as @a[team=tmf.afk] run team leave @s
    scoreboard players set @a tmf.afk 0
""")
fn("afk/update_sleep", """
    execute in minecraft:overworld store result score #tot tmf.tmp if entity @a[gamemode=!spectator,distance=0..]
    execute in minecraft:overworld store result score #afkn tmf.tmp if entity @a[gamemode=!spectator,distance=0..,tag=tmf.afk]
    scoreboard players operation #pct tmf.tmp = #sleep_pct tmf.cfg
    scoreboard players operation #act tmf.tmp = #tot tmf.tmp
    scoreboard players operation #act tmf.tmp -= #afkn tmf.tmp
    execute if score #afkn tmf.tmp matches 1.. if score #act tmf.tmp matches 1.. run function tmf:afk/calc_pct
    execute if score #pct tmf.tmp = #sleep_cur tmf.cfg run return 0
    scoreboard players operation #sleep_cur tmf.cfg = #pct tmf.tmp
    execute store result storage tmf:tmp sl.v int 1 run scoreboard players get #pct tmf.tmp
    function tmf:afk/set_gamerule with storage tmf:tmp sl
""")
fn("afk/calc_pct", """
    # needed = ceil(active * base / 100), at least 1;  pct = floor(needed * 100 / total)
    scoreboard players operation #need tmf.tmp = #act tmf.tmp
    scoreboard players operation #need tmf.tmp *= #sleep_pct tmf.cfg
    scoreboard players add #need tmf.tmp 99
    scoreboard players operation #need tmf.tmp /= #100 tmf.c
    execute if score #need tmf.tmp matches ..0 run scoreboard players set #need tmf.tmp 1
    scoreboard players operation #pct tmf.tmp = #need tmf.tmp
    scoreboard players operation #pct tmf.tmp *= #100 tmf.c
    scoreboard players operation #pct tmf.tmp /= #tot tmf.tmp
""")
fn("afk/set_gamerule", "$gamerule players_sleeping_percentage $(v)")
fn("afk/restore_sleep", """
    execute if score #sleep_cur tmf.cfg = #sleep_pct tmf.cfg run return 0
    scoreboard players operation #sleep_cur tmf.cfg = #sleep_pct tmf.cfg
    execute store result storage tmf:tmp sl.v int 1 run scoreboard players get #sleep_pct tmf.cfg
    function tmf:afk/set_gamerule with storage tmf:tmp sl
""")

# ---------------------------------------------------------------------------
# 19. Stats card
# ---------------------------------------------------------------------------
def tdiv(dst, src, div):
    return [f"scoreboard players operation {dst} tmf.tmp = {src}", f"scoreboard players operation {dst} tmf.tmp /= {div} tmf.c"]

fn("stats/trigger", """
    scoreboard players operation #v tmf.tmp = @s tmf.stats
    scoreboard players set @s tmf.stats 0
    execute unless score #stats_card tmf.cfg matches 1 run return run tellraw @s {text:"The stats card is disabled on this server.",color:"red"}
    execute if score #v tmf.tmp matches 2 run return run function tmf:stats/share
    function tmf:stats/show
""")
fn("stats/compute", """
    # playtime
    scoreboard players operation #pd tmf.tmp = @s tmf.s.play
    scoreboard players operation #pd tmf.tmp /= #1728000 tmf.c
    scoreboard players operation #ph tmf.tmp = @s tmf.s.play
    scoreboard players operation #ph tmf.tmp /= #72000 tmf.c
    scoreboard players operation #ph tmf.tmp %= #24 tmf.c
    scoreboard players operation #pm tmf.tmp = @s tmf.s.play
    scoreboard players operation #pm tmf.tmp /= #1200 tmf.c
    scoreboard players operation #pm tmf.tmp %= #60 tmf.c
    # time since last death
    scoreboard players operation #dh tmf.tmp = @s tmf.s.since
    scoreboard players operation #dh tmf.tmp /= #72000 tmf.c
    scoreboard players operation #dm tmf.tmp = @s tmf.s.since
    scoreboard players operation #dm tmf.tmp /= #1200 tmf.c
    scoreboard players operation #dm tmf.tmp %= #60 tmf.c
    # on foot (cm -> km x10)
    scoreboard players set #foot tmf.tmp 0
    scoreboard players operation #foot tmf.tmp += @s tmf.s.walk
    scoreboard players operation #foot tmf.tmp += @s tmf.s.sprint
    scoreboard players operation #foot tmf.tmp += @s tmf.s.crouch
    scoreboard players operation #foot tmf.tmp += @s tmf.s.swim
    scoreboard players operation #foot tmf.tmp += @s tmf.s.wow
    scoreboard players operation #foot tmf.tmp += @s tmf.s.wuw
    scoreboard players operation #foot tmf.tmp += @s tmf.s.climb
    scoreboard players operation #foot tmf.tmp /= #10000 tmf.c
    scoreboard players operation #fi tmf.tmp = #foot tmf.tmp
    scoreboard players operation #fi tmf.tmp /= #10 tmf.c
    scoreboard players operation #fd tmf.tmp = #foot tmf.tmp
    scoreboard players operation #fd tmf.tmp %= #10 tmf.c
    # riding / flying
    scoreboard players set #ride tmf.tmp 0
    scoreboard players operation #ride tmf.tmp += @s tmf.s.fly
    scoreboard players operation #ride tmf.tmp += @s tmf.s.boat
    scoreboard players operation #ride tmf.tmp += @s tmf.s.horse
    scoreboard players operation #ride tmf.tmp += @s tmf.s.cart
    scoreboard players operation #ride tmf.tmp += @s tmf.s.pig
    scoreboard players operation #ride tmf.tmp += @s tmf.s.strider
    scoreboard players operation #ride tmf.tmp += @s tmf.s.ghast
    scoreboard players operation #ride tmf.tmp += @s tmf.s.naut
    scoreboard players operation #ride tmf.tmp /= #10000 tmf.c
    scoreboard players operation #ri tmf.tmp = #ride tmf.tmp
    scoreboard players operation #ri tmf.tmp /= #10 tmf.c
    scoreboard players operation #rd tmf.tmp = #ride tmf.tmp
    scoreboard players operation #rd tmf.tmp %= #10 tmf.c
    # damage (stat is in tenths of a health point; 20 = one heart)
    scoreboard players operation #dmgd tmf.tmp = @s tmf.s.dmgd
    scoreboard players set #20 tmf.tmp 20
    scoreboard players operation #dmgd tmf.tmp /= #20 tmf.tmp
    scoreboard players operation #dmgt tmf.tmp = @s tmf.s.dmgt
    scoreboard players operation #dmgt tmf.tmp /= #20 tmf.tmp
    # make sure unset stats show as 0
    scoreboard players add @s tmf.s.deaths 0
    scoreboard players add @s tmf.s.mobs 0
    scoreboard players add @s tmf.s.pk 0
    scoreboard players add @s tmf.s.jump 0
    scoreboard players add @s tmf.s.fish 0
    scoreboard players add @s tmf.s.bred 0
    scoreboard players add @s tmf.s.trade 0
    scoreboard players add @s tmf.s.ench 0
    scoreboard players add @s tmf.s.sleep 0
""")
def S(name, color="white"):
    return '{score:{name:"%s",objective:"tmf.tmp"},color:"%s"}' % (name, color)
def P(obj, color="white"):
    return '{score:{name:"@s",objective:"%s"},color:"%s"}' % (obj, color)
LBL = lambda t: '{text:"%s",color:"gray"}' % t
fn("stats/show", f"""
    function tmf:stats/compute
    tellraw @s [{{text:"━━━━━━━ ",color:"dark_gray"}},{{text:"📊 ",color:"gold"}},{{selector:"@s",color:"gold",bold:true}},{{text:" ━━━━━━━",color:"dark_gray"}}]
    tellraw @s {{text:"  (counted since TMF was added to this world)",color:"dark_gray",italic:true}}
    tellraw @s [{LBL("  ⏱ Playtime: ")},{S("#pd","yellow")},{{text:"d ",color:"yellow"}},{S("#ph","yellow")},{{text:"h ",color:"yellow"}},{S("#pm","yellow")},{{text:"m",color:"yellow"}}]
    tellraw @s [{LBL("  ☠ Deaths: ")},{P("tmf.s.deaths")},{LBL("   since last death: ")},{S("#dh")},{{text:"h ",color:"white"}},{S("#dm")},{{text:"m",color:"white"}}]
    tellraw @s [{LBL("  ⚔ Mob kills: ")},{P("tmf.s.mobs")},{LBL("   Player kills: ")},{P("tmf.s.pk")}]
    tellraw @s [{LBL("  ❤ Damage dealt: ")},{S("#dmgd")},{LBL(" hearts   taken: ")},{S("#dmgt")},{LBL(" hearts")}]
    tellraw @s [{LBL("  👣 On foot: ")},{S("#fi")},{{text:".",color:"white"}},{S("#fd")},{LBL(" km   Riding/flying: ")},{S("#ri")},{{text:".",color:"white"}},{S("#rd")},{LBL(" km")}]
    tellraw @s [{LBL("  ⇡ Jumps: ")},{P("tmf.s.jump")},{LBL("   🛏 Nights slept: ")},{P("tmf.s.sleep")}]
    tellraw @s [{LBL("  🐟 Fish caught: ")},{P("tmf.s.fish")},{LBL("   🐄 Animals bred: ")},{P("tmf.s.bred")}]
    tellraw @s [{LBL("  💰 Villager trades: ")},{P("tmf.s.trade")},{LBL("   ✨ Items enchanted: ")},{P("tmf.s.ench")}]
    tellraw @s [{{text:"  "}},{{text:"[Share in chat]",color:"aqua",click_event:{{action:"run_command",command:"/trigger tmf.stats set 2"}},hover_event:{{action:"show_text",value:"Show a summary of your stats to everyone"}}}}]
""")
fn("stats/share", f"""
    execute if score @s tmf.share > #tick tmf.c run return run tellraw @s {{text:"Please wait a moment before sharing again.",color:"red"}}
    scoreboard players operation @s tmf.share = #tick tmf.c
    scoreboard players add @s tmf.share 600
    function tmf:stats/compute
    tellraw @a [{{text:"📊 ",color:"gold"}},{{selector:"@s",color:"gold"}},{LBL(": ")},{S("#pd","yellow")},{{text:"d ",color:"yellow"}},{S("#ph","yellow")},{{text:"h played",color:"yellow"}},{LBL(" · ")},{P("tmf.s.mobs")},{LBL(" mob kills · ")},{P("tmf.s.deaths")},{LBL(" deaths · ")},{S("#fi")},{{text:".",color:"white"}},{S("#fd")},{LBL(" km walked")}]
""")

# ---------------------------------------------------------------------------
# 20. Join & leave messages
# ---------------------------------------------------------------------------
fn("join/assign_id", """
    scoreboard players add #next tmf.id 1
    scoreboard players operation @s tmf.id = #next tmf.id
""")
fn("join/first_join", """
    tag @s add tmf.known
    execute unless score @s tmf.id matches 1.. run function tmf:join/assign_id
    scoreboard players set @s tmf.leave 0
    function tmf:locks/apply_self
    function tmf:join/ensure_online
    execute unless score #join_leave tmf.cfg matches 1 run return 0
    execute if entity @s[advancements={minecraft:story/root=true}] run return run function tmf:join/welcome
    execute if items entity @s container.* * run return run function tmf:join/welcome
    tellraw @a [{text:"✦ ",color:"gold"},{text:"Please welcome ",color:"yellow"},{selector:"@s",color:"gold",bold:true},{text:" – it's their first time here!",color:"yellow"}]
    function tmf:join/welcome
""")
fn("join/rejoin", """
    scoreboard players set @s tmf.leave 0
    function tmf:locks/apply_self
    function tmf:join/ensure_online
    # AFK state does not survive a reconnect
    execute if entity @s[tag=tmf.afk] run tag @s remove tmf.afk
    execute if entity @s[team=tmf.afk] run team leave @s
    scoreboard players set @s tmf.afk 0
    execute unless score #join_leave tmf.cfg matches 1 run return 0
    function tmf:join/welcome
""")
fn("join/welcome", """
    execute store result score #online tmf.tmp if entity @a
    tellraw @s [{text:"👋 Welcome, ",color:"yellow"},{selector:"@s",color:"gold"},{text:"! ",color:"yellow"},{score:{name:"#online",objective:"tmf.tmp"},color:"white"},{text:" player(s) online right now.",color:"gray"}]
    tellraw @s [{text:"   TMF features are active. ",color:"gray"},{text:"[Open settings]",color:"aqua",click_event:{action:"run_command",command:"/trigger tmf"},hover_event:{action:"show_text",value:"/trigger tmf"}}]
""")
fn("join/ensure_online", """
    # adds the player to the online list (with name + session start) if missing
    execute unless score @s tmf.id matches 1.. run function tmf:join/assign_id
    execute store result storage tmf:tmp on.id int 1 run scoreboard players get @s tmf.id
    function tmf:join/ensure_online_m with storage tmf:tmp on
""")
fn("join/ensure_online_m", """
    $execute if data storage tmf:data online[{id:$(id)}] run return 0
    scoreboard players operation @s tmf.sess = #tick tmf.c
    summon minecraft:item_display ~ ~ ~ {Tags:["tmf.namebuf"]}
    loot replace entity @n[type=minecraft:item_display,tag=tmf.namebuf] contents loot tmf:player_head
    $data modify storage tmf:tmp on.entry set value {id:$(id),name:"?",start:0}
    data modify storage tmf:tmp on.entry.name set from entity @n[type=minecraft:item_display,tag=tmf.namebuf] item.components."minecraft:profile".name
    execute store result storage tmf:tmp on.entry.start int 1 run scoreboard players get #tick tmf.c
    kill @e[type=minecraft:item_display,tag=tmf.namebuf]
    data modify storage tmf:data online append from storage tmf:tmp on.entry
""")
fn("join/check_leaves", """
    data modify storage tmf:tmp lv set value {todo:[],keep:[]}
    data modify storage tmf:tmp lv.todo set from storage tmf:data online
    execute if data storage tmf:tmp lv.todo[0] run function tmf:join/check_one
    data modify storage tmf:data online set from storage tmf:tmp lv.keep
""")
fn("join/check_one", """
    data modify storage tmf:tmp lv.cur set from storage tmf:tmp lv.todo[0]
    data remove storage tmf:tmp lv.todo[0]
    function tmf:join/check_one_m with storage tmf:tmp lv.cur
    execute if data storage tmf:tmp lv.todo[0] run function tmf:join/check_one
""")
fn("join/check_one_m", """
    $execute if entity @a[scores={tmf.id=$(id)}] run return run data modify storage tmf:tmp lv.keep append from storage tmf:tmp lv.cur
    # player left: session length
    $scoreboard players set #st tmf.tmp $(start)
    scoreboard players operation #len tmf.tmp = #tick tmf.c
    scoreboard players operation #len tmf.tmp -= #st tmf.tmp
    scoreboard players operation #lh tmf.tmp = #len tmf.tmp
    scoreboard players operation #lh tmf.tmp /= #72000 tmf.c
    scoreboard players operation #lm tmf.tmp = #len tmf.tmp
    scoreboard players operation #lm tmf.tmp /= #1200 tmf.c
    scoreboard players operation #lm tmf.tmp %= #60 tmf.c
    $execute if score #join_leave tmf.cfg matches 1 run tellraw @a [{text:"👋 ",color:"gray"},{text:"$(name)",color:"gray"},{text:" played for ",color:"dark_gray"},{score:{name:"#lh",objective:"tmf.tmp"},color:"gray"},{text:"h ",color:"gray"},{score:{name:"#lm",objective:"tmf.tmp"},color:"gray"},{text:"m this session. See you soon!",color:"dark_gray"}]
""")

# ---------------------------------------------------------------------------
# Locks
# ---------------------------------------------------------------------------
lock_lines = []
for key, num, name, desc, mode in PERSONAL:
    if mode == "out":
        lock_lines.append(f"execute if score #lock_{key} tmf.cfg matches 1 run tag @s remove tmf.off.{key}")
    else:
        lock_lines.append(f"execute if score #lock_{key} tmf.cfg matches 1 run tag @s add tmf.on.{key}")
fn("locks/apply_self", "\n".join(lock_lines))

# ---------------------------------------------------------------------------
# Menus
# ---------------------------------------------------------------------------
def label(name, state, color):
    return '{text:"",extra:[{text:%s,color:"white"},{text:%s,color:"%s"}]}' % (q(name + ": "), q(state), color)

def button(lbl, tooltip, command, width=200):
    return '{label:%s,tooltip:{text:%s},width:%d,action:{type:"minecraft:run_command",command:%s}}' % (lbl, q(tooltip), width, q(command))

APPEND = "data modify storage tmf:tmp d.dialog.actions append value "

def dialog_base(title, body, columns=2, exit_label="Close", exit_cmd=None):
    exit_action = '{label:{text:%s},width:150%s}' % (q(exit_label), (',action:{type:"minecraft:run_command",command:%s}' % q(exit_cmd)) if exit_cmd else "")
    return ('data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:%s,body:[{type:"minecraft:plain_message",contents:%s,width:340}],columns:%d,pause:false,actions:[],exit_action:%s}}'
            % (title, body, columns, exit_action))

# Player menu
lines = ["playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.4",
         dialog_base('{text:"TMF Settings",color:"gold",bold:true}',
                     '{text:"Switch your personal features on or off. 🔒 means an admin made the feature mandatory. Features switched off by the server are not listed.",color:"gray"}')]
for key, num, name, desc, mode in PERSONAL:
    cmd = f"/trigger tmf set {100 + num}"
    default_on = mode == "out"
    on_sel = f"@s[tag=!tmf.off.{key}]" if default_on else f"@s[tag=tmf.on.{key}]"
    off_sel = f"@s[tag=tmf.off.{key}]" if default_on else f"@s[tag=!tmf.on.{key}]"
    lines.append(f"execute if score #{key} tmf.cfg matches 1.. if score #lock_{key} tmf.cfg matches 1 run {APPEND}{button(label(name, 'On 🔒', 'dark_green'), desc + ' (Locked by an admin.)', cmd)}")
    lines.append(f"execute if score #{key} tmf.cfg matches 1.. unless score #lock_{key} tmf.cfg matches 1 if entity {on_sel} run {APPEND}{button(label(name, 'ON', 'green'), desc, cmd)}")
    lines.append(f"execute if score #{key} tmf.cfg matches 1.. unless score #lock_{key} tmf.cfg matches 1 if entity {off_sel} run {APPEND}{button(label(name, 'OFF', 'red'), desc, cmd)}")
lines.append(f"execute if score #stats_card tmf.cfg matches 1 run {APPEND}{button('{text:\"📊 My stats\",color:\"aqua\"}', 'Show your playtime and statistics', '/trigger tmf.stats')}")
lines.append(f"{APPEND}{button('{text:\"🖥 Server features\",color:\"aqua\"}', 'See which TMF features are enabled on this server', '/trigger tmf set 3')}")
lines.append(f"execute if entity @s[tag=tmf.admin] run {APPEND}{button('{text:\"⚙ Admin panel\",color:\"gold\"}', 'Server-wide settings', '/trigger tmf set 2')}")
lines.append("function tmf:util/show_dialog with storage tmf:tmp d")
fn("menu/open", "\n".join(lines))

# Server features (read-only notice)
lines = ['data modify storage tmf:tmp d set value {dialog:{type:"minecraft:notice",title:{text:"TMF – Server features",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"",extra:[]},width:340}],pause:false,action:{label:{text:"Back"},action:{type:"minecraft:run_command",command:"/trigger tmf set 1"}}}}']
for key, num, name, desc, mode in FEATURES:
    on = '{text:%s,color:"green"}' % q("✔ " + name + "\n")
    off = '{text:%s,color:"red"}' % q("✘ " + name + "\n")
    lines.append(f"execute if score #{key} tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {on}")
    lines.append(f"execute if score #{key} tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {off}")
lines.append('execute if score #perf tmf.cfg matches 1 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"\\n⚡ Performance mode is on: health bars and damage numbers are paused.",color:"yellow"}')
lines.append("function tmf:util/show_dialog with storage tmf:tmp d")
fn("menu/server_features", "\n".join(lines))

# Trigger dispatcher
lines = [
    "scoreboard players operation #v tmf.tmp = @s tmf",
    "scoreboard players set @s tmf 0",
    "execute if score #v tmf.tmp matches 1 run return run function tmf:menu/open",
    "execute if score #v tmf.tmp matches 3 run return run function tmf:menu/server_features",
]
for key, num, name, desc, mode in PERSONAL:
    lines.append(f"execute if score #v tmf.tmp matches {100 + num} run return run function tmf:menu/p/{key}")
lines += [
    'execute if score #v tmf.tmp matches 2.. unless score #v tmf.tmp matches 3..999 unless entity @s[tag=tmf.admin] run return run tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Only TMF admins can do that. An operator becomes an admin by running ",color:"red"},{text:"/function tmf:admin",color:"yellow"},{text:" once.",color:"red"}]',
    "execute if score #v tmf.tmp matches 2 run return run function tmf:admin/open",
]
for key, num, name, desc, mode in FEATURES:
    lines.append(f"execute if score #v tmf.tmp matches {1000 + num} run return run function tmf:admin/t/{key}")
for key, num, name, desc, mode in PERSONAL:
    lines.append(f"execute if score #v tmf.tmp matches {1100 + num} run return run function tmf:admin/l/{key}")
lines += [
    "execute if score #v tmf.tmp matches 1200 run return run function tmf:admin/presets",
    "execute if score #v tmf.tmp matches 1201 run return run function tmf:admin/preset/everything",
    "execute if score #v tmf.tmp matches 1202 run return run function tmf:admin/preset/recommended",
    "execute if score #v tmf.tmp matches 1203 run return run function tmf:admin/preset/minimal",
    "execute if score #v tmf.tmp matches 1204 run return run function tmf:admin/preset/off",
    "execute if score #v tmf.tmp matches 1210 run return run function tmf:admin/set/perf",
    "execute if score #v tmf.tmp matches 1211 run return run function tmf:admin/set/afk_min",
    "execute if score #v tmf.tmp matches 1213 run return run function tmf:admin/set/sleep_pct",
    "execute if score #v tmf.tmp matches 1220 run return run function tmf:admin/locks",
] + [f"execute if score #v tmf.tmp matches {1250 + i} run return run function tmf:admin/cat/{cid}" for i, (cid, _, _) in enumerate(CATEGORIES)] + [
    "execute if score #v tmf.tmp matches 1230 run return run function tmf:admin/changelog",
    "execute if score #v tmf.tmp matches 1240 run return run function tmf:admin/uninstall_confirm",
    "execute if score #v tmf.tmp matches 1299 run return run function tmf:uninstall",
]
fn("menu/trigger", "\n".join(lines))

# Personal toggles
for key, num, name, desc, mode in PERSONAL:
    tag = f"tmf.off.{key}" if mode == "out" else f"tmf.on.{key}"
    extra = ""
    if key == "fast_paths":
        extra = "execute if entity @s[tag=tmf.onpath] run function tmf:paths/remove\n"
    fn(f"menu/p/{key}", f"""
        execute if score #{key} tmf.cfg matches 0 run return run function tmf:menu/open
        execute if score #lock_{key} tmf.cfg matches 1 run return run function tmf:menu/open
        execute if entity @s[tag={tag}] run return run function tmf:menu/p/{key}_unset
        tag @s add {tag}
        {extra}function tmf:menu/open
    """)
    fn(f"menu/p/{key}_unset", f"""
        tag @s remove {tag}
        function tmf:menu/open
    """)

# ---------------------------------------------------------------------------
# Admin panel
# ---------------------------------------------------------------------------
fn("admin", """
    # Run this once as an operator to become a TMF admin and open the admin panel.
    tag @s add tmf.admin
    tellraw @s [{text:"[TMF] ",color:"gold"},{text:"You are now a TMF admin. Open the panel any time with ",color:"gray"},{text:"/trigger tmf set 2",color:"yellow"},{text:" or from ",color:"gray"},{text:"/trigger tmf",color:"yellow"},{text:".",color:"gray"}]
    function tmf:admin/open
""")

ON_DISABLE = {
    "fast_paths": "execute as @a[tag=tmf.onpath] run function tmf:paths/remove",
    "enderman_guard": "function tmf:enderman/strip_all",
    "health_bars": "execute as @e[tag=tmf.hb] run function tmf:combat/hb_clear",
    "damage_numbers": "kill @e[type=minecraft:text_display,tag=tmf.dn]",
    "afk": "function tmf:afk/clear_all",
    "silence_mobs": "function tmf:silence/off_all",
    "no_trample": "execute as @a[tag=tmf.ntsf] run function tmf:trample/landed",
    "leaf_decay": "kill @e[type=minecraft:marker,tag=tmf.ld]",
    "fence_jump": "execute as @a[tag=tmf.fj] run function tmf:fence/remove",
}

# main admin page: one button per category (with how many of its features are on) + settings
lines = ["playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.2",
         dialog_base('{text:"TMF Admin Panel",color:"gold",bold:true}',
                     '{text:"Pick a category to switch its features on or off for the whole server. Players can still turn personal features off for themselves unless you lock them.",color:"gray"}',
                     exit_label="Back", exit_cmd="/trigger tmf set 1")]
for cid, cname, keys in CATEGORIES:
    lines.append("scoreboard players set #cnt tmf.tmp 0")
    lines += [f"execute if score #{k} tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1" for k in keys]
    lines.append(f"execute store result storage tmf:tmp a.c_{cid} int 1 run scoreboard players get #cnt tmf.tmp")
lines.append("function tmf:admin/open_categories with storage tmf:tmp a")
lines.append(f"execute if score #perf tmf.cfg matches 1 run {APPEND}{button(label('⚡ Performance mode', 'ON', 'yellow'), 'Pauses health bars and damage numbers and slows down the enderman and cauldron scans.', '/trigger tmf set 1210')}")
lines.append(f"execute if score #perf tmf.cfg matches 0 run {APPEND}{button(label('⚡ Performance mode', 'OFF', 'gray'), 'Pauses health bars and damage numbers and slows down the enderman and cauldron scans.', '/trigger tmf set 1210')}")
lines.append("execute store result storage tmf:tmp a.afk int 1 run scoreboard players get #afk_min tmf.cfg")
lines.append("execute store result storage tmf:tmp a.sleep int 1 run scoreboard players get #sleep_pct tmf.cfg")
lines.append("function tmf:admin/open_settings with storage tmf:tmp a")
lines.append(f"{APPEND}{button('{text:\"🎛 Presets…\",color:\"aqua\"}', 'Apply a ready-made set of features', '/trigger tmf set 1200')}")
lines.append(f"{APPEND}{button('{text:\"🔒 Player locks…\",color:\"aqua\"}', 'Force personal features on for everyone', '/trigger tmf set 1220')}")
lines.append(f"{APPEND}{button('{text:\"📜 Changelog\",color:\"aqua\"}', 'What is in this version', '/trigger tmf set 1230')}")
lines.append(f"{APPEND}{button('{text:\"🗑 Uninstall TMF…\",color:\"red\"}', 'Remove all TMF data from the world', '/trigger tmf set 1240')}")
lines.append("function tmf:util/show_dialog with storage tmf:tmp d")
fn("admin/open", "\n".join(lines))
fn("admin/open_categories", "\n".join(
    ["$" + APPEND + button('{text:"",extra:[{text:%s,color:"gold"},{text:"  $(c_%s)/%d on",color:"gray"}]}' % (q(cname), cid, len(keys)),
                           "Open " + cname[2:], f"/trigger tmf set {1250 + i}") for i, (cid, cname, keys) in enumerate(CATEGORIES)]))
for i, (cid, cname, keys) in enumerate(CATEGORIES):
    cl = ["playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.3",
          dialog_base('{text:%s,color:"gold",bold:true}' % q("TMF – " + cname[2:]),
                      '{text:"Click a feature to switch it on or off for the whole server. Hover for a description.",color:"gray"}',
                      exit_label="Back", exit_cmd="/trigger tmf set 2")]
    for key, num, name, desc, mode in FEATURES:
        if key not in keys:
            continue
        cmd = f"/trigger tmf set {1000 + num}"
        if key == "pet_protect":
            cl.append(f"execute if score #{key} tmf.cfg matches 0 run {APPEND}{button(label(name, 'OFF', 'red'), desc + ' Click to cycle.', cmd)}")
            cl.append(f"execute if score #{key} tmf.cfg matches 1 run {APPEND}{button(label(name, 'Owner only', 'green'), desc + ' Click to cycle.', cmd)}")
            cl.append(f"execute if score #{key} tmf.cfg matches 2 run {APPEND}{button(label(name, 'All players', 'aqua'), desc + ' Click to cycle.', cmd)}")
            continue
        cl.append(f"execute if score #{key} tmf.cfg matches 1.. run {APPEND}{button(label(name, 'ON', 'green'), desc, cmd)}")
        cl.append(f"execute if score #{key} tmf.cfg matches 0 run {APPEND}{button(label(name, 'OFF', 'red'), desc, cmd)}")
    cl.append("function tmf:util/show_dialog with storage tmf:tmp d")
    fn(f"admin/cat/{cid}", "\n".join(cl))
fn("admin/open_settings", "\n".join([
    "$" + APPEND + button(label("💤 AFK after", "$(afk) min", "yellow"), "How long a player must be idle before being marked AFK. Click to cycle.", "/trigger tmf set 1211"),
    "$" + APPEND + button(label("🛏 Players needed to sleep", "$(sleep)%", "yellow"), "Base players_sleeping_percentage. AFK players are left out of the count. Click to cycle.", "/trigger tmf set 1213"),
]))

for key, num, name, desc, mode in FEATURES:
    off_hook = ON_DISABLE.get(key, "")
    if key == "pet_protect":
        fn(f"admin/t/{key}", f"""
            scoreboard players add #{key} tmf.cfg 1
            execute if score #{key} tmf.cfg matches 3.. run scoreboard players set #{key} tmf.cfg 0
            function tmf:config/apply
            function tmf:admin/cat/{CAT_OF[key]}
        """)
        continue
    fn(f"admin/t/{key}", f"""
        execute if score #{key} tmf.cfg matches 1.. run return run function tmf:admin/t/{key}_off
        scoreboard players set #{key} tmf.cfg 1
        function tmf:config/apply
        tellraw @a[tag=tmf.admin] [{{text:"[TMF] ",color:"gold"}},{{text:{q(name)},color:"white"}},{{text:" enabled",color:"green"}}]
        function tmf:admin/cat/{CAT_OF[key]}
    """)
    fn(f"admin/t/{key}_off", f"""
        scoreboard players set #{key} tmf.cfg 0
        {off_hook}
        function tmf:config/apply
        tellraw @a[tag=tmf.admin] [{{text:"[TMF] ",color:"gold"}},{{text:{q(name)},color:"white"}},{{text:" disabled",color:"red"}}]
        function tmf:admin/cat/{CAT_OF[key]}
    """)

fn("admin/set/perf", """
    execute if score #perf tmf.cfg matches 1 run return run function tmf:admin/set/perf_off
    scoreboard players set #perf tmf.cfg 1
    function tmf:combat/clear_all
    function tmf:admin/open
""")
fn("admin/set/perf_off", """
    scoreboard players set #perf tmf.cfg 0
    function tmf:admin/open
""")
def cycle(name, score, values):
    lines = []
    for a, b in zip(values, values[1:] + values[:1]):
        lines.append(f"execute if score #{score} tmf.cfg matches {a} run return run function tmf:admin/set/{name}_to {{v:{b}}}")
    lines.append(f"function tmf:admin/set/{name}_to {{v:{values[0]}}}")
    fn(f"admin/set/{name}", "\n".join(lines))
    fn(f"admin/set/{name}_to", f"""
        $scoreboard players set #{score} tmf.cfg $(v)
        function tmf:config/apply
        function tmf:admin/open
    """)
cycle("afk_min", "afk_min", [2, 3, 5, 10, 15, 30])
cycle("sleep_pct", "sleep_pct", [0, 25, 50, 75, 100])
# make the sleep setting apply immediately
fn("admin/set/sleep_pct_to", """
    $scoreboard players set #sleep_pct tmf.cfg $(v)
    scoreboard players set #sleep_cur tmf.cfg -1
    execute if score #afk tmf.cfg matches 0 run function tmf:afk/restore_sleep
    execute if score #afk tmf.cfg matches 1 run function tmf:afk/update_sleep
    function tmf:admin/open
""")

# Presets
PRESETS = {
    "everything": ("Everything on", "All features enabled.", {k: 1 for k in FKEYS}),
    "recommended": ("Recommended (default)", "The default selection: convenience and info features on, gameplay-changing ones off.",
                    {k: (1 if k in DEFAULT_ON else 0) for k in FKEYS}),
    "minimal": ("Minimal", "Only information features: shulker preview, horse stats, death glow, AFK, stats card, join/leave messages.",
                {k: (1 if k in ("shulker_preview", "horse_stats", "death_glow", "afk", "stats_card", "join_leave") else 0) for k in FKEYS}),
    "off": ("All off", "Every feature disabled (TMF stays installed).", {k: 0 for k in FKEYS}),
}
lines = ['data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"TMF Presets",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"Applying a preset replaces all feature switches. Player locks and personal choices are kept.",color:"gray"},width:340}],columns:1,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}}}']
for i, (pid, (pname, pdesc, vals)) in enumerate(PRESETS.items()):
    lines.append(APPEND + button('{text:%s,color:"aqua"}' % q(pname), pdesc, f"/trigger tmf set {1201 + i}", 300))
    body = []
    for k in FKEYS:
        v = vals[k]
        if v == 0 and k in ON_DISABLE:
            body.append(f"execute if score #{k} tmf.cfg matches 1.. run {ON_DISABLE[k]}")
        body.append(f"scoreboard players set #{k} tmf.cfg {v}")
    body += ["function tmf:config/apply",
             f'tellraw @a[tag=tmf.admin] [{{text:"[TMF] ",color:"gold"}},{{text:"Preset applied: ",color:"gray"}},{{text:{q(pname)},color:"aqua"}}]',
             "function tmf:admin/open"]
    fn(f"admin/preset/{pid}", "\n".join(body))
lines.append("function tmf:util/show_dialog with storage tmf:tmp d")
fn("admin/presets", "\n".join(lines))
_body = []
for k in FKEYS:
    v = 1 if k in DEFAULT_ON else 0
    if v == 0 and k in ON_DISABLE:
        _body.append(f"execute if score #{k} tmf.cfg matches 1.. run {ON_DISABLE[k]}")
    _body.append(f"scoreboard players set #{k} tmf.cfg {v}")
fn("admin/preset/recommended_silent", "\n".join(_body))

# Locks page
lines = ['data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"TMF Player Locks",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"A locked feature is forced on for every player and can\'t be switched off in their menu.",color:"gray"},width:340}],columns:2,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}}}']
for key, num, name, desc, mode in PERSONAL:
    cmd = f"/trigger tmf set {1100 + num}"
    lines.append(f"execute if score #lock_{key} tmf.cfg matches 1 run {APPEND}{button(label(name, '🔒 Locked', 'gold'), 'Click to unlock', cmd)}")
    lines.append(f"execute unless score #lock_{key} tmf.cfg matches 1 run {APPEND}{button(label(name, 'Player choice', 'gray'), 'Click to force this on for everyone', cmd)}")
lines.append("function tmf:util/show_dialog with storage tmf:tmp d")
fn("admin/locks", "\n".join(lines))
for key, num, name, desc, mode in PERSONAL:
    apply = f"tag @a remove tmf.off.{key}" if mode == "out" else f"tag @a add tmf.on.{key}"
    fn(f"admin/l/{key}", f"""
        execute if score #lock_{key} tmf.cfg matches 1 run return run function tmf:admin/l/{key}_off
        scoreboard players set #lock_{key} tmf.cfg 1
        {apply}
        function tmf:admin/locks
    """)
    fn(f"admin/l/{key}_off", f"""
        scoreboard players set #lock_{key} tmf.cfg 0
        function tmf:admin/locks
    """)

CHANGELOG = (f"TMF v{VERSION} (for Minecraft Java 26.3)\n\n"
             "v1.10.0\n"
             "• Admin panel: features are grouped into categories (Mining & tools, Farming & building, Inventory, Pets & mobs, Combat, Movement & info, Multiplayer), each showing how many of its features are on.\n\n"
             "v1.9.2\n"
             "• Item Magnet is now switched off server-wide by default.\n\n"
             "v1.9.1\n"
             "• Tree Feller no longer tracks placed logs. It now only fells real trees: the trunk must end in natural leaves (player-placed leaves don't count), and it never spreads more than 7 blocks sideways or below the chopped log.\n\n"
             "v1.9.0\n"
             "• Renamed to TMF – Too Many Features. Commands are now /trigger tmf, /trigger tmf.stats and /function tmf:admin.\n"
             "• Tree Feller no longer cuts logs that players placed (logs placed from this version on).\n\n"
             "v1.8.0\n"
             "• New: Wandering Trader Alert, Sort Chest, Pickup Notices, Item Magnet, Breeding Info, Sapling Replant, Copper Oxidation Info, Playtime Milestones, Day Counter.\n\n"
             "v1.7.0\n"
             "• Removed: Armor Stand Editor.\n"
             "• Tool Protector, Tool Auto-Swap and the Coordinates HUD are now off for each player until they switch them on in /trigger tmf.\n\n"
             "v1.6.0\n"
             "• Renamed to AtQ – All the Quality (formerly QoL+).\n\n"
             "v1.5.0\n"
             "• Tool Auto-Swap also swaps while you keep mining (tunnelling), works up to your full reach then, and also switches away from swords.\n"
             "• Features switched off by the server no longer appear in the player menu.\n\n"
             "v1.4.0\n"
             "• New default selection: only 16 features start switched on (use Presets → Everything on to enable all).\n"
             "• Tool Auto-Swap reacts instantly to your first left-click and ignores chests, doors, crafting tables and other blocks you right-click.\n"
             "• Coordinates HUD is now light grey. Spawn-Proof Checker shows one small flame per spot.\n"
             "• Removed: Hunger HUD.\n\n"
             "v1.3.0\n"
             "• Renamed: Tool Auto-Swap is now Tool Protector; Best Tool Switcher is now Tool Auto-Swap.\n"
             "• Tool Auto-Swap now swaps only when you start breaking a block, not when you just look at it.\n"
             "• Spawn-Proof Checker markers are brighter and visible in the dark.\n"
             "• Removed: Player Pings, biome in the Coordinates HUD.\n\n"
             "v1.2.0\n"
             "• New: Veinminer, Tree Feller, Fence Jumping.\n"
             "• Ladder Dropping now also places ladders where there is no wall behind them.\n\n"
             "v1.1.0\n"
             "• New: Right-Click Harvest, Invisible Item Frames, Armor Stand Editor, No Crop Trampling, Fast Leaf Decay, Armor Warning, Best Tool Switcher, Coordinates HUD, Spawn-Proof Checker, Player Pings.\n"
             "• Removed: XP Bottling.\n"
             "• Left-clicking a ladder while holding ladders now breaks it.\n\n"
             "v1.0.0\n"
             "• 20 toggleable features with a player menu (/trigger tmf) and an admin panel.\n"
             "• Personal opt-out for player-facing features, admin locks to force them on.\n"
             "• Presets: Everything on, Vanilla+, Minimal, All off.\n"
             "• Performance mode for busy servers.\n"
             "• Clean uninstall from the admin panel.")
fn("admin/changelog", 'dialog show @s {type:"minecraft:notice",title:{text:"TMF Changelog",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:%s,color:"white"},width:340}],pause:false,action:{label:{text:"Back"},action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}}' % q(CHANGELOG))
fn("admin/uninstall_confirm", 'dialog show @s {type:"minecraft:confirmation",title:{text:"Uninstall TMF?",color:"red",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"This removes all TMF scoreboards, tags, settings and helper entities and restores the game rules it changed. Afterwards delete the TMF folder from the world\'s datapacks folder (or run /datapack disable), otherwise it installs itself again on the next reload.",color:"gray"},width:340}],pause:false,yes:{label:{text:"Uninstall",color:"red"},action:{type:"minecraft:run_command",command:"/trigger tmf set 1299"}},no:{label:{text:"Cancel"},action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}}')

# ===========================================================================
# v1.1.0 modules
# ===========================================================================
js(f"data/{NS}/tags/block/harvestable.json", {"values": ["minecraft:wheat", "minecraft:carrots", "minecraft:potatoes",
    "minecraft:beetroots", "minecraft:nether_wart", "minecraft:cocoa"]})
js(f"data/{NS}/tags/block/vein/quartz.json", {"values": ["minecraft:nether_quartz_ore"]})
js(f"data/{NS}/tags/block/vein/debris.json", {"values": ["minecraft:ancient_debris"]})
js(f"data/{NS}/tags/block/tillable.json", {"values": ["minecraft:dirt", "minecraft:grass_block", "minecraft:coarse_dirt",
    "minecraft:rooted_dirt", "minecraft:dirt_path"]})
js(f"data/{NS}/tags/block/axe_usable.json", {"values": ['minecraft:chiseled_copper', 'minecraft:copper_bars', 'minecraft:copper_block', 'minecraft:copper_bulb', 'minecraft:copper_chain', 'minecraft:copper_chest', 'minecraft:copper_door', 'minecraft:copper_golem_statue', 'minecraft:copper_grate', 'minecraft:copper_lantern', 'minecraft:copper_torch', 'minecraft:copper_trapdoor', 'minecraft:copper_wall_torch', 'minecraft:cut_copper', 'minecraft:cut_copper_slab', 'minecraft:cut_copper_stairs', 'minecraft:exposed_chiseled_copper', 'minecraft:exposed_copper', 'minecraft:exposed_copper_bars', 'minecraft:exposed_copper_bulb', 'minecraft:exposed_copper_chain', 'minecraft:exposed_copper_chest', 'minecraft:exposed_copper_door', 'minecraft:exposed_copper_golem_statue', 'minecraft:exposed_copper_grate', 'minecraft:exposed_copper_lantern', 'minecraft:exposed_copper_trapdoor', 'minecraft:exposed_cut_copper', 'minecraft:exposed_cut_copper_slab', 'minecraft:exposed_cut_copper_stairs', 'minecraft:oxidized_chiseled_copper', 'minecraft:oxidized_copper', 'minecraft:oxidized_copper_bars', 'minecraft:oxidized_copper_bulb', 'minecraft:oxidized_copper_chain', 'minecraft:oxidized_copper_chest', 'minecraft:oxidized_copper_door', 'minecraft:oxidized_copper_golem_statue', 'minecraft:oxidized_copper_grate', 'minecraft:oxidized_copper_lantern', 'minecraft:oxidized_copper_trapdoor', 'minecraft:oxidized_cut_copper', 'minecraft:oxidized_cut_copper_slab', 'minecraft:oxidized_cut_copper_stairs', 'minecraft:waxed_chiseled_copper', 'minecraft:waxed_copper_bars', 'minecraft:waxed_copper_block', 'minecraft:waxed_copper_bulb', 'minecraft:waxed_copper_chain', 'minecraft:waxed_copper_chest', 'minecraft:waxed_copper_door', 'minecraft:waxed_copper_golem_statue', 'minecraft:waxed_copper_grate', 'minecraft:waxed_copper_lantern', 'minecraft:waxed_copper_trapdoor', 'minecraft:waxed_cut_copper', 'minecraft:waxed_cut_copper_slab', 'minecraft:waxed_cut_copper_stairs', 'minecraft:waxed_exposed_chiseled_copper', 'minecraft:waxed_exposed_copper', 'minecraft:waxed_exposed_copper_bars', 'minecraft:waxed_exposed_copper_bulb', 'minecraft:waxed_exposed_copper_chain', 'minecraft:waxed_exposed_copper_chest', 'minecraft:waxed_exposed_copper_door', 'minecraft:waxed_exposed_copper_golem_statue', 'minecraft:waxed_exposed_copper_grate', 'minecraft:waxed_exposed_copper_lantern', 'minecraft:waxed_exposed_copper_trapdoor', 'minecraft:waxed_exposed_cut_copper', 'minecraft:waxed_exposed_cut_copper_slab', 'minecraft:waxed_exposed_cut_copper_stairs', 'minecraft:waxed_oxidized_chiseled_copper', 'minecraft:waxed_oxidized_copper', 'minecraft:waxed_oxidized_copper_bars', 'minecraft:waxed_oxidized_copper_bulb', 'minecraft:waxed_oxidized_copper_chain', 'minecraft:waxed_oxidized_copper_chest', 'minecraft:waxed_oxidized_copper_door', 'minecraft:waxed_oxidized_copper_golem_statue', 'minecraft:waxed_oxidized_copper_grate', 'minecraft:waxed_oxidized_copper_lantern', 'minecraft:waxed_oxidized_copper_trapdoor', 'minecraft:waxed_oxidized_cut_copper', 'minecraft:waxed_oxidized_cut_copper_slab', 'minecraft:waxed_oxidized_cut_copper_stairs', 'minecraft:waxed_weathered_chiseled_copper', 'minecraft:waxed_weathered_copper', 'minecraft:waxed_weathered_copper_bars', 'minecraft:waxed_weathered_copper_bulb', 'minecraft:waxed_weathered_copper_chain', 'minecraft:waxed_weathered_copper_chest', 'minecraft:waxed_weathered_copper_door', 'minecraft:waxed_weathered_copper_golem_statue', 'minecraft:waxed_weathered_copper_grate', 'minecraft:waxed_weathered_copper_lantern', 'minecraft:waxed_weathered_copper_trapdoor', 'minecraft:waxed_weathered_cut_copper', 'minecraft:waxed_weathered_cut_copper_slab', 'minecraft:waxed_weathered_cut_copper_stairs', 'minecraft:weathered_chiseled_copper', 'minecraft:weathered_copper', 'minecraft:weathered_copper_bars', 'minecraft:weathered_copper_bulb', 'minecraft:weathered_copper_chain', 'minecraft:weathered_copper_chest', 'minecraft:weathered_copper_door', 'minecraft:weathered_copper_golem_statue', 'minecraft:weathered_copper_grate', 'minecraft:weathered_copper_lantern', 'minecraft:weathered_copper_trapdoor', 'minecraft:weathered_cut_copper', 'minecraft:weathered_cut_copper_slab', 'minecraft:weathered_cut_copper_stairs']})
js(f"data/{NS}/tags/block/bt_skip.json", {"values": ['#minecraft:doors', '#minecraft:trapdoors', '#minecraft:fence_gates', '#minecraft:buttons', '#minecraft:beds', '#minecraft:all_signs', '#minecraft:shulker_boxes', '#minecraft:anvil', '#minecraft:campfires', '#minecraft:cauldrons', '#minecraft:candles', '#minecraft:flower_pots', 'minecraft:chest', 'minecraft:trapped_chest', 'minecraft:ender_chest', 'minecraft:barrel', 'minecraft:crafting_table', 'minecraft:furnace', 'minecraft:blast_furnace', 'minecraft:smoker', 'minecraft:lectern', 'minecraft:loom', 'minecraft:cartography_table', 'minecraft:smithing_table', 'minecraft:stonecutter', 'minecraft:grindstone', 'minecraft:enchanting_table', 'minecraft:brewing_stand', 'minecraft:beacon', 'minecraft:hopper', 'minecraft:dispenser', 'minecraft:dropper', 'minecraft:crafter', 'minecraft:jukebox', 'minecraft:note_block', 'minecraft:lever', 'minecraft:comparator', 'minecraft:repeater', 'minecraft:daylight_detector', 'minecraft:respawn_anchor', 'minecraft:bell', 'minecraft:chiseled_bookshelf', 'minecraft:decorated_pot', 'minecraft:composter', 'minecraft:cake', 'minecraft:beehive', 'minecraft:bee_nest', 'minecraft:vault', 'minecraft:copper_bulb', 'minecraft:exposed_copper_bulb', 'minecraft:weathered_copper_bulb', 'minecraft:oxidized_copper_bulb', 'minecraft:waxed_copper_bulb', 'minecraft:waxed_exposed_copper_bulb', 'minecraft:waxed_weathered_copper_bulb', 'minecraft:waxed_oxidized_copper_bulb', 'minecraft:command_block', 'minecraft:chain_command_block', 'minecraft:repeating_command_block', 'minecraft:structure_block', 'minecraft:jigsaw', 'minecraft:spawner', 'minecraft:trial_spawner', 'minecraft:redstone_wire']})
js(f"data/{NS}/tags/block/jumpable.json", {"values": ["#minecraft:fences", "#minecraft:walls"]})
js(f"data/{NS}/tags/item/tools.json", {"values": ["#minecraft:pickaxes", "#minecraft:axes", "#minecraft:shovels", "#minecraft:swords",
    "#minecraft:hoes", "minecraft:shears"]})
js(f"data/{NS}/tags/item/torches.json", {"values": ["minecraft:torch", "minecraft:soul_torch", "minecraft:copper_torch",
    "minecraft:redstone_torch"]})
js(f"data/{NS}/tags/entity_type/item_frames.json", {"values": ["minecraft:item_frame", "minecraft:glow_item_frame"]})
js(f"data/{NS}/tags/block/spawn_space.json", {"values": [
    "minecraft:air", "minecraft:cave_air", "minecraft:void_air", "minecraft:short_grass", "minecraft:tall_grass",
    "minecraft:fern", "minecraft:large_fern", "minecraft:dead_bush", "minecraft:bush", "minecraft:short_dry_grass",
    "minecraft:tall_dry_grass", "minecraft:leaf_litter", "minecraft:vine", "minecraft:glow_lichen", "#minecraft:flowers"]})
js(f"data/{NS}/tags/block/no_spawn_surface.json", {"values": [
    "#minecraft:air", "#minecraft:replaceable", "#minecraft:leaves", "#minecraft:impermeable", "#minecraft:fences",
    "#minecraft:walls", "#minecraft:trapdoors", "#minecraft:wool_carpets", "#minecraft:rails",
    "#minecraft:pressure_plates", "#minecraft:buttons", "#minecraft:all_signs", "#minecraft:doors",
    "minecraft:farmland", "minecraft:dirt_path", "minecraft:barrier", "minecraft:bedrock", "minecraft:glass_pane",
    "minecraft:iron_bars", "minecraft:chest", "minecraft:trapped_chest", "minecraft:ender_chest", "minecraft:ladder",
    "minecraft:scaffolding", "minecraft:magma_block", "minecraft:lava", "minecraft:water"]})

js(f"data/{NS}/predicate/falling_unprotected.json", {"type": "minecraft:all_of", "terms": [
    entity_pred({"minecraft:flags": {"is_on_ground": False}, "minecraft:movement": {"fall_distance": {"min": 0.6}}}),
    {"type": "minecraft:inverted", "term": entity_pred({"minecraft:effects": {"minecraft:slow_falling": {}}})}]})
def loc(pred, dy=0):
    d = {"type": "minecraft:location_check", "predicate": pred}
    if dy:
        d["offsetY"] = dy
    return d
js(f"data/{NS}/predicate/spawnable.json", {"type": "minecraft:all_of", "terms": [
    loc({"block": {"blocks": "#tmf:spawn_space"}, "light": {"light": {"max": 0}}}),
    loc({"block": {"blocks": "#tmf:spawn_space"}}, 1),
    {"type": "minecraft:inverted", "term": loc({"block": {"blocks": "#tmf:no_spawn_surface"}}, -1)},
    {"type": "minecraft:inverted", "term": loc({"block": {"blocks": "#minecraft:slabs", "state": {"type": "bottom"}}}, -1)},
    {"type": "minecraft:inverted", "term": loc({"block": {"blocks": "#minecraft:stairs", "state": {"half": "bottom"}}}, -1)},
]})

# ---------------------------------------------------------------------------
# 20. Right-click harvest
# ---------------------------------------------------------------------------
MATURE = [("wheat", 7), ("carrots", 7), ("potatoes", 7), ("beetroots", 3), ("nether_wart", 3), ("cocoa", 2)]
fn("harvest/is_mature", "\n".join([f"execute if block ~ ~ ~ minecraft:{b}[age={a}] run return 1" for b, a in MATURE] + ["return fail"]))
SEEDS = {"wheat": "wheat_seeds", "carrots": "carrot", "potatoes": "potato", "beetroots": "beetroot_seeds", "nether_wart": "nether_wart"}
hv = ["execute unless function tmf:harvest/is_mature run return 0",
      'data modify storage tmf:tmp hv set value {seed:"minecraft:air",state:"minecraft:air"}']
for b, sd in SEEDS.items():
    hv.append(f'execute if block ~ ~ ~ minecraft:{b} run data modify storage tmf:tmp hv set value {{seed:"minecraft:{sd}",state:"minecraft:{b}[age=0]"}}')
for f in ("north", "south", "east", "west"):
    hv.append(f'execute if block ~ ~ ~ minecraft:cocoa[facing={f}] run data modify storage tmf:tmp hv set value {{seed:"minecraft:cocoa_beans",state:"minecraft:cocoa[age=0,facing={f}]"}}')
hv += ["loot spawn ~ ~0.25 ~ mine ~ ~ ~ mainhand",
       "function tmf:harvest/replant with storage tmf:tmp hv",
       "playsound minecraft:block.crop.break block @a ~ ~ ~ 1 1",
       "particle minecraft:happy_villager ~ ~0.5 ~ 0.3 0.2 0.3 0 4",
       "swing @s mainhand"]
fn("harvest/right_click", "\n".join(hv))
fn("harvest/replant", """
    $execute as @e[type=minecraft:item,distance=..1.5,limit=1,nbt={Age:0s,Item:{id:"$(seed)"}}] run function tmf:harvest/take_seed
    $setblock ~ ~ ~ $(state)
""")
fn("harvest/take_seed", """
    execute store result score #c tmf.tmp run data get entity @s Item.count
    execute if score #c tmf.tmp matches ..1 run return run kill @s
    scoreboard players remove #c tmf.tmp 1
    execute store result entity @s Item.count int 1 run scoreboard players get #c tmf.tmp
""")
fn("harvest/left_click", """
    execute unless entity @s[gamemode=creative] run loot spawn ~ ~0.25 ~ mine ~ ~ ~ mainhand
    setblock ~ ~ ~ minecraft:air
    playsound minecraft:block.crop.break block @a ~ ~ ~ 1 1
""")

# ---------------------------------------------------------------------------
# 21. Invisible item frames (shears)
# ---------------------------------------------------------------------------
adv("frames/interact", "player_interacted_with_entity", {
    "player": entity_pred({"minecraft:flags": {"is_sneaking": False}, "minecraft:entity_tags": {"all_of": ["tmf.sh"]}}),
    "entity": entity_pred({"minecraft:entity_type": "#tmf:item_frames"})
}, "frames/interact")
fn("frames/interact", """
    advancement revoke @s only tmf:frames/interact
    execute unless score #invisible_frames tmf.cfg matches 1 run return 0
    execute if entity @s[tag=tmf.off.invisible_frames] run return 0
    tag @s add tmf.hs_player
    scoreboard players set #found tmf.tmp 0
    execute as @e[type=#tmf:item_frames,distance=..6] run function tmf:frames/candidate
    execute if score #found tmf.tmp matches 0 as @e[type=#tmf:item_frames,distance=..4,sort=nearest,limit=1] run function tmf:frames/handle
    tag @s remove tmf.hs_player
""")
fn("frames/candidate", """
    execute if score #found tmf.tmp matches 1 run return 0
    tag @s add tmf.hs_cand
    execute if entity @a[tag=tmf.hs_player,limit=1,predicate=tmf:looking_at_candidate] run function tmf:frames/handle
    tag @s remove tmf.hs_cand
""")
fn("frames/handle", """
    scoreboard players set #found tmf.tmp 1
    # the shears were just put into an empty frame: give them back
    execute if items entity @s contents minecraft:shears unless items entity @a[tag=tmf.hs_player,limit=1] weapon.mainhand minecraft:shears run return run function tmf:frames/took
    # the frame already held an item and got rotated: undo the rotation
    execute if items entity @s contents * run function tmf:frames/unrotate
    function tmf:frames/toggle
""")
fn("frames/took", """
    item replace entity @a[tag=tmf.hs_player,limit=1] weapon.mainhand from entity @s contents
    item replace entity @s contents with minecraft:air
    function tmf:frames/toggle
""")
fn("frames/unrotate", """
    execute store result score #rot tmf.tmp run data get entity @s ItemRotation
    scoreboard players add #rot tmf.tmp 7
    scoreboard players set #k tmf.tmp 8
    scoreboard players operation #rot tmf.tmp %= #k tmf.tmp
    execute store result entity @s ItemRotation byte 1 run scoreboard players get #rot tmf.tmp
""")
fn("frames/toggle", """
    execute if data entity @s {Invisible:1b} run return run function tmf:frames/show
    data modify entity @s Invisible set value 1b
    execute at @s run playsound minecraft:entity.sheep.shear player @a ~ ~ ~ 0.7 1.5
""")
fn("frames/show", """
    data modify entity @s Invisible set value 0b
    execute at @s run playsound minecraft:entity.sheep.shear player @a ~ ~ ~ 0.7 0.8
""")


# ---------------------------------------------------------------------------
# 23. No crop trampling
# ---------------------------------------------------------------------------
fn("trample/above_farmland", "\n".join(
    [f"execute if block ~ ~{dy} ~ minecraft:farmland run return 1" for dy in ("-0.5", "-1.5", "-2.5", "-3.5", "-4.5")] + ["return fail"]))
fn("trample/protect", """
    effect give @s minecraft:slow_falling 1 0 true
    tag @s add tmf.ntsf
""")
fn("trample/landed", """
    effect clear @s minecraft:slow_falling
    tag @s remove tmf.ntsf
""")

# ---------------------------------------------------------------------------
# 24. Fast leaf decay
# ---------------------------------------------------------------------------
fn("leaves/check_chops", "\n".join(
    [f'execute as @a[scores={{tmf.lg.{i}=1..}}] at @s run function tmf:wood/chopped {{tag:"{log_family(l)}"}}' for i, l in enumerate(LOGS)]))
fn("wood/chopped", "\n".join(
    [f"scoreboard players set @s tmf.lg.{i} 0" for i in range(len(LOGS))] +
    ['$data modify storage tmf:tmp wc set value {tag:"$(tag)"}',
     "scoreboard players set #r tmf.tmp 0",
     "execute anchored eyes positioned ^ ^ ^ run function tmf:wood/ray"]))
fn("wood/ray", """
    execute unless block ~ ~ ~ #tmf:ray_pass positioned ^ ^ ^-0.3 run return run function tmf:wood/at_point
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches 55.. run return run function tmf:wood/at_point
    execute positioned ^ ^ ^0.1 run function tmf:wood/ray
""")
fn("wood/at_point", """
    execute if score #tree_feller tmf.cfg matches 1 if entity @s[tag=!tmf.off.tree_feller,predicate=tmf:sneaking,gamemode=!creative,gamemode=!spectator] if items entity @s weapon.mainhand #minecraft:axes align xyz if function tmf:wood/is_tree run function tmf:wood/fell with storage tmf:tmp wc
    execute if score #leaf_decay tmf.cfg matches 1 run function tmf:leaves/mark
""")
def scan27(call):
    out = []
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            for dz in (-1, 0, 1):
                out.append(f"$execute positioned ~{dx} ~{dy} ~{dz} run function {call}")
    return out
def neigh26(call):
    out = []
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            for dz in (-1, 0, 1):
                if dx or dy or dz:
                    out.append(f"$execute positioned ~{dx} ~{dy} ~{dz} run function {call}")
    return out
# --- natural-tree check: a real tree has non-persistent (natural) leaves near the top of its trunk.
#     Leaves placed by players are always persistent, so log buildings never count as trees.
fn("wood/is_tree", "return run function tmf:wood/is_tree_m with storage tmf:tmp wc")
_find = []
for dy in (0, 1, -1):
    for dx in (0, 1, -1):
        for dz in (0, 1, -1):
            _find.append(f'$execute positioned ~{dx} ~{dy} ~{dz} if block ~ ~ ~ #$(tag) run return run function tmf:wood/climb {{tag:"$(tag)"}}')
fn("wood/is_tree_m", "\n".join(["scoreboard players set #up tmf.tmp 0"] + _find + ["return run function tmf:wood/leaves_near"]))
fn("wood/climb", """
    scoreboard players add #up tmf.tmp 1
    $execute if score #up tmf.tmp matches ..48 if block ~ ~1 ~ #$(tag) positioned ~ ~1 ~ run return run function tmf:wood/climb {tag:"$(tag)"}
    return run function tmf:wood/leaves_near
""")
_near = sorted(((dx, dy, dz) for dx in range(-3, 4) for dy in range(-3, 4) for dz in range(-3, 4)), key=lambda v: abs(v[0]) + abs(v[1]) + abs(v[2]))
fn("wood/leaves_near", "\n".join(
    [f"execute if block ~{dx} ~{dy} ~{dz} #minecraft:leaves[persistent=false] run return 1" for dx, dy, dz in _near] +
    [f"execute if block ~{dx} ~{dy} ~{dz} #tmf:nether_canopy run return 1" for dx, dy, dz in _near] + ["return fail"]))
js(f"data/{NS}/tags/block/nether_canopy.json", {"values": [
    "minecraft:nether_wart_block", "minecraft:warped_wart_block", "minecraft:shroomlight"]})

fn("wood/fell", "\n".join([
    "scoreboard players set #vbudget tmf.tmp 200",
    'summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags:["tmf.fs"]}',
    "function tmf:mine/tool_init",
] + scan27('tmf:wood/fill {tag:"$(tag)"}') + [
    "execute if score #vbudget tmf.tmp matches ..199 run playsound minecraft:block.wood.break block @a ~ ~ ~ 1 0.8",
    "kill @e[type=minecraft:marker,tag=tmf.fs]",
]))
fn("wood/fill", "\n".join([
    "$execute unless block ~ ~ ~ #$(tag) run return 0",
    "# stay within 7 blocks sideways of the chopped log and never go below it",
    "execute positioned ~-7 ~-40 ~-7 unless entity @e[type=minecraft:marker,tag=tmf.fs,dx=14,dy=41,dz=14] run return 0",
    "execute if score #vbudget tmf.tmp matches ..0 run return 0",
    "execute unless function tmf:mine/damage_tool run return 0",
    "scoreboard players remove #vbudget tmf.tmp 1",
    "loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~ mainhand",
    "setblock ~ ~ ~ minecraft:air",
    "execute if score #leaf_decay tmf.cfg matches 1 unless entity @e[type=minecraft:marker,tag=tmf.ld,distance=..4] if function tmf:wood/near_leaves positioned ~0.5 ~0.5 ~0.5 run function tmf:leaves/mark",
] + neigh26('tmf:wood/fill {tag:"$(tag)"}')))
fn("wood/near_leaves", "\n".join(
    [f"execute if block {p} #minecraft:leaves run return 1" for p in ("~1 ~ ~", "~-1 ~ ~", "~ ~1 ~", "~ ~-1 ~", "~ ~ ~1", "~ ~ ~-1")] + ["return fail"]))

# ---- shared mining helpers (tool durability)
fn("mine/tool_init", """
    scoreboard players set #tdmg tmf.tmp 0
    execute store result score #tdmg tmf.tmp run data get entity @s SelectedItem.components."minecraft:damage"
    execute store success score #silk tmf.tmp if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:silk_touch"}]]
""")
fn("mine/damage_tool", """
    execute if entity @s[gamemode=creative] run return 1
    execute if items entity @s weapon.mainhand *[minecraft:unbreakable] run return 1
    execute unless items entity @s weapon.mainhand *[minecraft:damage~{durability:{min:2}}] run return fail
    scoreboard players add #tdmg tmf.tmp 1
    execute store result storage tmf:tmp td.d int 1 run scoreboard players get #tdmg tmf.tmp
    function tmf:mine/set_damage with storage tmf:tmp td
    return 1
""")
fn("mine/set_damage", '$item modify entity @s weapon.mainhand {type:"minecraft:set_components",components:{"minecraft:damage":$(d)}}')

# ---- veinminer
fn("vein/check", "\n".join(
    [f'execute as @a[scores={{tmf.or.{i}=1..}}] at @s run function tmf:vein/mined {{tag:"{fam}",xp:{xp}}}' for i, (o, fam, xp) in enumerate(ORES)]))
fn("vein/mined", "\n".join(
    [f"scoreboard players set @s tmf.or.{i} 0" for i in range(len(ORES))] + [
    "execute if entity @s[tag=tmf.off.veinminer] run return 0",
    "execute unless entity @s[predicate=tmf:sneaking,gamemode=!creative,gamemode=!spectator] run return 0",
    "execute unless items entity @s weapon.mainhand #minecraft:pickaxes run return 0",
    '$data modify storage tmf:tmp vm set value {tag:"$(tag)",xp:$(xp)}',
    "scoreboard players set #r tmf.tmp 0",
    "execute anchored eyes positioned ^ ^ ^ run function tmf:vein/ray"]))
fn("vein/ray", """
    execute unless block ~ ~ ~ #tmf:ray_pass positioned ^ ^ ^-0.3 align xyz run return run function tmf:vein/start with storage tmf:tmp vm
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches 55.. run return fail
    execute positioned ^ ^ ^0.1 run function tmf:vein/ray
""")
fn("vein/start", "\n".join([
    "scoreboard players set #vbudget tmf.tmp 64",
    "function tmf:mine/tool_init",
] + scan27('tmf:vein/fill {tag:"$(tag)",xp:$(xp)}')))
fn("vein/fill", "\n".join([
    "$execute unless block ~ ~ ~ #$(tag) run return 0",
    "execute if score #vbudget tmf.tmp matches ..0 run return 0",
    "execute unless function tmf:mine/damage_tool run return 0",
    "scoreboard players remove #vbudget tmf.tmp 1",
    "loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~ mainhand",
    "setblock ~ ~ ~ minecraft:air",
    "$execute if score #silk tmf.tmp matches 0 if score #vbudget tmf.tmp matches 0.. run function tmf:vein/xp {xp:$(xp)}",
    "playsound minecraft:block.stone.break block @a ~ ~ ~ 0.5 1",
] + neigh26('tmf:vein/fill {tag:"$(tag)",xp:$(xp)}')))
fn("vein/xp", """
    $scoreboard players set #xpv tmf.tmp $(xp)
    execute if score #xpv tmf.tmp matches ..0 run return 0
    $summon minecraft:experience_orb ~0.5 ~0.5 ~0.5 {Value:$(xp)s}
""")

# ---- fence jumping
fn("fence/facing", """
    execute rotated ~ 0 positioned ^ ^ ^0.55 unless function tmf:fence/jumpable_here run return fail
    execute unless block ~ ~2 ~ #tmf:ray_pass run return fail
    return 1
""")
fn("fence/jumpable_here", """
    execute unless block ~ ~ ~ #tmf:jumpable unless block ~ ~ ~ #minecraft:fence_gates[open=false] run return fail
    execute unless block ~ ~1 ~ #tmf:ray_pass run return fail
    execute unless block ~ ~2 ~ #tmf:ray_pass run return fail
    return 1
""")
fn("fence/keep", """
    execute unless score #fence_jump tmf.cfg matches 1 run return fail
    execute if entity @s[tag=tmf.off.fence_jump] run return fail
    execute unless entity @s[predicate=tmf:on_ground] run return 1
    execute if function tmf:fence/facing run return 1
    return fail
""")
fn("fence/add", """
    attribute @s minecraft:jump_strength modifier add tmf:fence_jump 0.1 add_value
    tag @s add tmf.fj
""")
fn("fence/remove", """
    attribute @s minecraft:jump_strength modifier remove tmf:fence_jump
    tag @s remove tmf.fj
""")

fn("leaves/mark", """
    summon minecraft:marker ~ ~ ~ {Tags:["tmf.ld","tmf.ld_new"]}
    scoreboard players set @e[type=minecraft:marker,tag=tmf.ld_new] tmf.ldt 0
    tag @e[type=minecraft:marker,tag=tmf.ld_new] remove tmf.ld_new
""")
fn("leaves/marker_tick", """
    scoreboard players add @s tmf.ldt 5
    execute if score @s tmf.ldt matches 15 align xyz run function tmf:leaves/process
    execute if score @s tmf.ldt matches 40 align xyz run function tmf:leaves/process
    execute if score @s tmf.ldt matches 40.. run kill @s
""")
scan = ["scoreboard players set #budget tmf.tmp 800"]
for dx in range(-3, 4):
    for dy in range(-3, 4):
        for dz in range(-3, 4):
            scan.append(f"execute positioned ~{dx} ~{dy} ~{dz} if block ~ ~ ~ #minecraft:leaves[persistent=false,distance=7] run function tmf:leaves/fill")
scan.append("execute if score #budget tmf.tmp matches ..799 run playsound minecraft:block.azalea_leaves.break block @a ~ ~ ~ 1 0.9")
fn("leaves/process", "\n".join(scan))
fn("leaves/fill", """
    execute unless block ~ ~ ~ #minecraft:leaves[persistent=false,distance=7] run return 0
    execute if score #budget tmf.tmp matches ..0 run return 0
    scoreboard players remove #budget tmf.tmp 1
    loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~
    setblock ~ ~ ~ minecraft:air
    execute positioned ~1 ~ ~ run function tmf:leaves/fill
    execute positioned ~-1 ~ ~ run function tmf:leaves/fill
    execute positioned ~ ~1 ~ run function tmf:leaves/fill
    execute positioned ~ ~-1 ~ run function tmf:leaves/fill
    execute positioned ~ ~ ~1 run function tmf:leaves/fill
    execute positioned ~ ~ ~-1 run function tmf:leaves/fill
""")

# ---------------------------------------------------------------------------
# 25. Armor warning
# ---------------------------------------------------------------------------
for slot, items, obj, word, sslot in (("head", "#minecraft:head_armor", "tmf.awh", "helmet", "armor.head"),
                                      ("chest", "#minecraft:chest_armor", "tmf.awc", "chestplate", "armor.chest"),
                                      ("legs", "#minecraft:leg_armor", "tmf.awl", "leggings", "armor.legs"),
                                      ("feet", "#minecraft:foot_armor", "tmf.awf", "boots", "armor.feet"),
                                      ("elytra", "minecraft:elytra", "tmf.awe", "elytra", "armor.chest")):
    adv(f"armor_warn/{slot}", "item_durability_changed",
        {"durability": {"max": 20}, "delta": {"max": -1}, "item": {"items": items}}, f"armor_warn/{slot}")
    fn(f"armor_warn/{slot}", f"""
        advancement revoke @s only tmf:armor_warn/{slot}
        execute unless score #armor_warning tmf.cfg matches 1 run return 0
        execute if entity @s[tag=tmf.off.armor_warning] run return 0
        execute unless items entity @s {sslot} {items}[minecraft:damage~{{durability:{{max:20}}}}] run return 0
        execute if score @s {obj} > #tick tmf.c run return 0
        scoreboard players operation @s {obj} = #tick tmf.c
        scoreboard players add @s {obj} 600
        function tmf:util/actionbar_cd
        title @s actionbar [{{text:"⚠ ",color:"red"}},{{text:"Your {word} is about to break!",color:"gold"}}]
        tellraw @s [{{text:"⚠ ",color:"red"}},{{text:"Your {word} has 20 or less durability left.",color:"gold"}}]
        playsound minecraft:block.anvil.land player @s ~ ~ ~ 0.3 1.8
    """)

# ---------------------------------------------------------------------------
# 26. Best tool switcher
# ---------------------------------------------------------------------------
BT_CATS = [(1, 'pickaxe', '#minecraft:pickaxes'), (2, 'axe', '#minecraft:axes'), (3, 'shovel', '#minecraft:shovels'), (4, 'hoe', '#minecraft:hoes'), (5, 'shears', 'minecraft:shears')]
fn("bt/category", """
    scoreboard players set #cat tmf.tmp 0
    execute if block ~ ~ ~ #minecraft:shears_extreme_breaking_speed if items entity @s container.* minecraft:shears run return run scoreboard players set #cat tmf.tmp 5
    execute if block ~ ~ ~ #minecraft:mineable/pickaxe run return run scoreboard players set #cat tmf.tmp 1
    execute if block ~ ~ ~ #minecraft:mineable/axe run return run scoreboard players set #cat tmf.tmp 2
    execute if block ~ ~ ~ #minecraft:mineable/shovel run return run scoreboard players set #cat tmf.tmp 3
    execute if block ~ ~ ~ #minecraft:mineable/hoe run return run scoreboard players set #cat tmf.tmp 4
    execute if block ~ ~ ~ #minecraft:shears_major_breaking_speed run return run scoreboard players set #cat tmf.tmp 5
    execute if block ~ ~ ~ #minecraft:shears_minor_breaking_speed run return run scoreboard players set #cat tmf.tmp 5
""")
fn("bt/needs_swap", "\n".join([
    "function tmf:bt/category",
    "execute if score #cat tmf.tmp matches 0 run return fail",
] + [f"execute if score #cat tmf.tmp matches {n} if items entity @s weapon.mainhand {tag} run return fail" for n, c, tag in BT_CATS] + [
    "# keep right-click tool uses working (tilling, scraping copper, putting out campfires)",
    "execute if items entity @s weapon.mainhand #minecraft:hoes if block ~ ~ ~ #tmf:tillable run return fail",
    "execute if items entity @s weapon.mainhand #minecraft:axes if block ~ ~ ~ #tmf:axe_usable run return fail",
    "execute if items entity @s weapon.mainhand #minecraft:shovels if block ~ ~ ~ #minecraft:campfires run return fail",
] + [f"execute if score #cat tmf.tmp matches {n} if items entity @s container.* {tag}[minecraft:damage~{{durability:{{min:3}}}}] run return 1" for n, c, tag in BT_CATS] + [
    "return fail",
]))
fn("bt/swap_now", "\n".join([
    "function tmf:bt/category",
] + [f"execute if score #cat tmf.tmp matches {n} run return run function tmf:bt/want_{c}" for n, c, tag in BT_CATS]))
adv("bt/hit", "player_hurt_entity", {"entity": entity_pred({"minecraft:entity_type": "minecraft:interaction",
    "minecraft:entity_tags": {"all_of": ["tmf.ov.bt"]}})}, "bt/hit")
fn("bt/hit", """
    advancement revoke @s only tmf:bt/hit
    tag @s add tmf.clicker
    execute as @e[type=minecraft:interaction,tag=tmf.ov.bt,distance=..6] if data entity @s attack if function tmf:bt/attacked_by_me at @s run function tmf:bt/hit_overlay
    tag @s remove tmf.clicker
""")
fn("bt/attacked_by_me", """
    execute on attacker if entity @s[tag=tmf.clicker] run return 1
    return fail
""")
fn("bt/hit_overlay", """
    data remove entity @s attack
    execute as @a[tag=tmf.clicker,limit=1] run function tmf:bt/swap_now
    kill @s
""")
for cat, items in (("pickaxe", "#minecraft:pickaxes"), ("axe", "#minecraft:axes"), ("shovel", "#minecraft:shovels"),
                   ("hoe", "#minecraft:hoes"), ("shears", "minecraft:shears"), ("sword", "#minecraft:swords")):
    adv(f"bt/mining_{cat}", "item_durability_changed", {"delta": {"max": -1}, "item": {"items": items}}, f"bt/mining_{cat}")
    fn(f"bt/mining_{cat}", f"""
        advancement revoke @s only tmf:bt/mining_{cat}
        execute if score @s tmf.fight > #tick tmf.c run return 0
        scoreboard players operation @s tmf.mine = #tick tmf.c
        scoreboard players add @s tmf.mine 100
    """)
fn("bt/mine_ray_start", """
    scoreboard players set #r tmf.tmp 0
    function tmf:bt/mine_ray
""")
fn("bt/mine_ray", """
    execute unless block ~ ~ ~ #tmf:ray_pass run return run function tmf:bt/mine_target
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..46 positioned ^ ^ ^0.1 run function tmf:bt/mine_ray
""")
fn("bt/mine_target", """
    execute if block ~ ~ ~ #tmf:bt_skip run return fail
    execute align xyz if function tmf:bt/needs_swap run return run function tmf:bt/swap_now
    return fail
""")
fn("bt/suppress", """
    scoreboard players operation @s tmf.btsup = #tick tmf.c
    scoreboard players add @s tmf.btsup 40
""")
MATERIALS = ["netherite", "diamond", "iron", "copper", "stone", "golden", "wooden"]
for cat, tag in (("pickaxe", "#minecraft:pickaxes"), ("axe", "#minecraft:axes"), ("shovel", "#minecraft:shovels"), ("hoe", "#minecraft:hoes")):
    fn(f"bt/want_{cat}", "\n".join(
        [f"execute if items entity @s weapon.mainhand {tag} run return 1"] +
        [f'execute if items entity @s container.* minecraft:{m}_{cat}[minecraft:damage~{{durability:{{min:3}}}}] run return run function tmf:bt/find {{id:"minecraft:{m}_{cat}"}}' for m in MATERIALS] +
        ["return fail"]))
fn("bt/want_shears", """
    execute if items entity @s weapon.mainhand minecraft:shears run return 1
    execute if items entity @s container.* minecraft:shears[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:shears"}
    return fail
""")
fn("bt/find", """
    $data modify storage tmf:tmp swap.id set value "$(id)"
    return run function tmf:bt/find_m with storage tmf:tmp swap
""")
bt_lines = []
for i in range(9):
    bt_lines.append(f'$execute if items entity @s hotbar.{i} $(id)[minecraft:damage~{{durability:{{min:3}}}}] run return run function tmf:bt/swap {{slot:"hotbar.{i}"}}')
for i in range(27):
    bt_lines.append(f'$execute if items entity @s inventory.{i} $(id)[minecraft:damage~{{durability:{{min:3}}}}] run return run function tmf:bt/swap {{slot:"inventory.{i}"}}')
bt_lines.append("return fail")
fn("bt/find_m", "\n".join(bt_lines))
fn("bt/swap", """
    scoreboard players operation @s tmf.mine = #tick tmf.c
    scoreboard players add @s tmf.mine 100
    summon minecraft:item_display ~ ~ ~ {Tags:["tmf.swap"]}
    $item replace entity @n[type=minecraft:item_display,tag=tmf.swap] contents from entity @s $(slot)
    $item replace entity @s $(slot) from entity @s weapon.mainhand
    item replace entity @s weapon.mainhand from entity @n[type=minecraft:item_display,tag=tmf.swap] contents
    kill @e[type=minecraft:item_display,tag=tmf.swap]
    playsound minecraft:item.armor.equip_generic player @s ~ ~ ~ 0.3 1.8
    return 1
""")

# ---------------------------------------------------------------------------
# 28. Spawn-proof checker
# ---------------------------------------------------------------------------
sc = []
for dy in range(-3, 3):
    for dx in range(-6, 7):
        for dz in range(-6, 7):
            sc.append(f"execute positioned ~{dx} ~{dy} ~{dz} if predicate tmf:spawnable run function tmf:spawn/mark")
fn("spawn/scan", "\n".join(sc))
fn("spawn/mark", """
    particle minecraft:small_flame ~ ~0.05 ~ 0 0 0 0 1 force @s
""")

LEGACY_PREFIXES = ["qol", "atq"]   # namespaces used by earlier versions (QoL+, AtQ)
_leg = ["# removes data left behind by earlier versions (QoL+ / AtQ)"]
for _p in LEGACY_PREFIXES:
    _leg += [f"scoreboard objectives remove {o.replace('tmf', _p, 1)}" for o in DUMMIES + ["tmf", "tmf.stats", "tmf.deaths", "tmf.leave"] + list(STAT_OBJ)]
    _leg += [
        f"team remove {_p}.afk",
        f"execute as @a[tag={_p}.onpath] run attribute @s minecraft:movement_speed modifier remove {_p}:fast_path",
        f"execute as @a[tag={_p}.fj] run attribute @s minecraft:jump_strength modifier remove {_p}:fence_jump",
        f"execute as @e[tag={_p}.pg] if items entity @s armor.feet minecraft:barrier[minecraft:custom_data~{{{_p}_pet_guard:1b}}] run item replace entity @s armor.feet with minecraft:air",
        f"execute as @e[tag={_p}.hb] run data remove entity @s CustomName",
        f"execute as @e[type=minecraft:enderman,tag={_p}.eg] if data entity @s {{carriedBlockState:{{id:\"minecraft:structure_void\"}}}} run data remove entity @s carriedBlockState",
        f"execute as @e[type=minecraft:enderman,tag={_p}.eg] if data entity @s {{carriedBlockState:\"minecraft:structure_void\"}} run data remove entity @s carriedBlockState",
        f"kill @e[type=minecraft:interaction,tag={_p}.ov]",
        f"kill @e[type=minecraft:marker,tag={_p}.ld]",
        f"kill @e[type=minecraft:text_display,tag={_p}.dn]",
        f"schedule clear {_p}:loop/t5",
        f"schedule clear {_p}:loop/t20",
        f"data remove storage {_p}:data online",
        f"data remove storage {_p}:data rank",
        f"data remove storage {_p}:tmp d",
    ] + [f"tag @a remove {_p}.{t}" for t in ["known", "admin", "sneaking", "onpath", "fj", "afk", "ntsf", "sh", "invdirty"]] \
      + [f"tag @a remove {_p}.off.{k}" for k in FKEYS] + [f"tag @a remove {_p}.on.{k}" for k in FKEYS]
fn("legacy_cleanup", "\n".join(_leg))

# ===========================================================================
# v1.8.0 modules
# ===========================================================================
_ITEMS = {"abandoned_camp_map": 64, "acacia_boat": 1, "acacia_button": 64, "acacia_chest_boat": 1, "acacia_door": 64, "acacia_fence": 64, "acacia_fence_gate": 64, "acacia_hanging_sign": 16, "acacia_leaves": 64, "acacia_log": 64, "acacia_planks": 64, "acacia_pressure_plate": 64, "acacia_sapling": 64, "acacia_shelf": 64, "acacia_sign": 16, "acacia_slab": 64, "acacia_stairs": 64, "acacia_trapdoor": 64, "acacia_wood": 64, "activator_rail": 64, "allay_spawn_egg": 64, "allium": 64, "amethyst_block": 64, "amethyst_cluster": 64, "amethyst_shard": 64, "ancient_debris": 64, "andesite": 64, "andesite_slab": 64, "andesite_stairs": 64, "andesite_wall": 64, "angler_pottery_sherd": 64, "anvil": 64, "apple": 64, "archer_pottery_sherd": 64, "armadillo_scute": 64, "armadillo_spawn_egg": 64, "armor_stand": 16, "arms_up_pottery_sherd": 64, "arrow": 64, "axolotl_bucket": 1, "axolotl_spawn_egg": 64, "azalea": 64, "azalea_leaves": 64, "azure_bluet": 64, "baked_potato": 64, "bamboo": 64, "bamboo_block": 64, "bamboo_button": 64, "bamboo_chest_raft": 1, "bamboo_door": 64, "bamboo_fence": 64, "bamboo_fence_gate": 64, "bamboo_hanging_sign": 16, "bamboo_mosaic": 64, "bamboo_mosaic_slab": 64, "bamboo_mosaic_stairs": 64, "bamboo_planks": 64, "bamboo_pressure_plate": 64, "bamboo_raft": 1, "bamboo_shelf": 64, "bamboo_sign": 16, "bamboo_slab": 64, "bamboo_stairs": 64, "bamboo_trapdoor": 64, "barrel": 64, "barrier": 64, "basalt": 64, "bat_spawn_egg": 64, "beacon": 64, "bedrock": 64, "bee_nest": 64, "bee_spawn_egg": 64, "beef": 64, "beehive": 64, "beetroot": 64, "beetroot_seeds": 64, "beetroot_soup": 1, "bell": 64, "big_dripleaf": 64, "birch_boat": 1, "birch_button": 64, "birch_chest_boat": 1, "birch_door": 64, "birch_fence": 64, "birch_fence_gate": 64, "birch_hanging_sign": 16, "birch_leaves": 64, "birch_log": 64, "birch_planks": 64, "birch_pressure_plate": 64, "birch_sapling": 64, "birch_shelf": 64, "birch_sign": 16, "birch_slab": 64, "birch_stairs": 64, "birch_trapdoor": 64, "birch_wood": 64, "black_banner": 16, "black_bed": 1, "black_bundle": 1, "black_candle": 64, "black_carpet": 64, "black_concrete": 64, "black_concrete_powder": 64, "black_concrete_slab": 64, "black_concrete_stairs": 64, "black_cushion": 16, "black_dye": 64, "black_glazed_terracotta": 64, "black_harness": 1, "black_shulker_box": 1, "black_stained_glass": 64, "black_stained_glass_pane": 64, "black_terracotta": 64, "black_wool": 64, "black_wool_slab": 64, "black_wool_stairs": 64, "blackstone": 64, "blackstone_slab": 64, "blackstone_stairs": 64, "blackstone_wall": 64, "blade_pottery_sherd": 64, "blast_furnace": 64, "blaze_powder": 64, "blaze_rod": 64, "blaze_spawn_egg": 64, "blue_banner": 16, "blue_bed": 1, "blue_bundle": 1, "blue_candle": 64, "blue_carpet": 64, "blue_concrete": 64, "blue_concrete_powder": 64, "blue_concrete_slab": 64, "blue_concrete_stairs": 64, "blue_cushion": 16, "blue_dye": 64, "blue_egg": 16, "blue_glazed_terracotta": 64, "blue_harness": 1, "blue_ice": 64, "blue_orchid": 64, "blue_shulker_box": 1, "blue_stained_glass": 64, "blue_stained_glass_pane": 64, "blue_terracotta": 64, "blue_wool": 64, "blue_wool_slab": 64, "blue_wool_stairs": 64, "bogged_spawn_egg": 64, "bolt_armor_trim_smithing_template": 64, "bone": 64, "bone_block": 64, "bone_meal": 64, "book": 64, "bookshelf": 64, "bordure_indented_banner_pattern": 1, "bow": 1, "bowl": 64, "brain_coral": 64, "brain_coral_block": 64, "brain_coral_fan": 64, "bread": 64, "breeze_rod": 64, "breeze_spawn_egg": 64, "brewer_pottery_sherd": 64, "brewing_stand": 64, "brick": 64, "brick_slab": 64, "brick_stairs": 64, "brick_wall": 64, "bricks": 64, "brown_banner": 16, "brown_bed": 1, "brown_bundle": 1, "brown_candle": 64, "brown_carpet": 64, "brown_concrete": 64, "brown_concrete_powder": 64, "brown_concrete_slab": 64, "brown_concrete_stairs": 64, "brown_cushion": 16, "brown_dye": 64, "brown_egg": 16, "brown_glazed_terracotta": 64, "brown_harness": 1, "brown_mushroom": 64, "brown_mushroom_block": 64, "brown_shulker_box": 1, "brown_stained_glass": 64, "brown_stained_glass_pane": 64, "brown_terracotta": 64, "brown_wool": 64, "brown_wool_slab": 64, "brown_wool_stairs": 64, "brush": 1, "bubble_coral": 64, "bubble_coral_block": 64, "bubble_coral_fan": 64, "bucket": 16, "budding_amethyst": 64, "bundle": 1, "buried_ancient_city_map": 64, "buried_mineshaft_map": 64, "buried_treasure_map": 64, "buried_trial_chambers_map": 64, "burn_pottery_sherd": 64, "bush": 64, "cactus": 64, "cactus_flower": 64, "cake": 1, "calcite": 64, "calibrated_sculk_sensor": 64, "camel_husk_spawn_egg": 64, "camel_spawn_egg": 64, "campfire": 64, "candle": 64, "carrot": 64, "carrot_on_a_stick": 1, "cartography_table": 64, "carved_pumpkin": 64, "cat_spawn_egg": 64, "cauldron": 64, "cave_spider_spawn_egg": 64, "chain_command_block": 64, "chainmail_boots": 1, "chainmail_chestplate": 1, "chainmail_helmet": 1, "chainmail_leggings": 1, "charcoal": 64, "cherry_boat": 1, "cherry_button": 64, "cherry_chest_boat": 1, "cherry_door": 64, "cherry_fence": 64, "cherry_fence_gate": 64, "cherry_hanging_sign": 16, "cherry_leaves": 64, "cherry_log": 64, "cherry_planks": 64, "cherry_pressure_plate": 64, "cherry_sapling": 64, "cherry_shelf": 64, "cherry_sign": 16, "cherry_slab": 64, "cherry_stairs": 64, "cherry_trapdoor": 64, "cherry_wood": 64, "chest": 64, "chest_minecart": 1, "chicken": 64, "chicken_spawn_egg": 64, "chipped_anvil": 64, "chiseled_bookshelf": 64, "chiseled_cinnabar": 64, "chiseled_copper": 64, "chiseled_deepslate": 64, "chiseled_nether_bricks": 64, "chiseled_polished_blackstone": 64, "chiseled_quartz_block": 64, "chiseled_red_sandstone": 64, "chiseled_resin_bricks": 64, "chiseled_sandstone": 64, "chiseled_stone_bricks": 64, "chiseled_sulfur": 64, "chiseled_tuff": 64, "chiseled_tuff_bricks": 64, "chorus_flower": 64, "chorus_fruit": 64, "chorus_plant": 64, "cinnabar": 64, "cinnabar_brick_slab": 64, "cinnabar_brick_stairs": 64, "cinnabar_brick_wall": 64, "cinnabar_bricks": 64, "cinnabar_slab": 64, "cinnabar_stairs": 64, "cinnabar_wall": 64, "clay": 64, "clay_ball": 64, "clock": 64, "closed_eyeblossom": 64, "coal": 64, "coal_block": 64, "coal_ore": 64, "coarse_dirt": 64, "coast_armor_trim_smithing_template": 64, "cobbled_deepslate": 64, "cobbled_deepslate_slab": 64, "cobbled_deepslate_stairs": 64, "cobbled_deepslate_wall": 64, "cobblestone": 64, "cobblestone_slab": 64, "cobblestone_stairs": 64, "cobblestone_wall": 64, "cobweb": 64, "cocoa_beans": 64, "cod": 64, "cod_bucket": 1, "cod_spawn_egg": 64, "command_block": 64, "command_block_minecart": 1, "comparator": 64, "compass": 64, "composter": 64, "conduit": 64, "cooked_beef": 64, "cooked_chicken": 64, "cooked_cod": 64, "cooked_mutton": 64, "cooked_porkchop": 64, "cooked_rabbit": 64, "cooked_salmon": 64, "cookie": 64, "copper_axe": 1, "copper_bars": 64, "copper_block": 64, "copper_boots": 1, "copper_bulb": 64, "copper_chain": 64, "copper_chest": 64, "copper_chestplate": 1, "copper_door": 64, "copper_golem_spawn_egg": 64, "copper_golem_statue": 64, "copper_grate": 64, "copper_helmet": 1, "copper_hoe": 1, "copper_horse_armor": 1, "copper_ingot": 64, "copper_lantern": 64, "copper_leggings": 1, "copper_nautilus_armor": 1, "copper_nugget": 64, "copper_ore": 64, "copper_pickaxe": 1, "copper_shovel": 1, "copper_spear": 1, "copper_sword": 1, "copper_torch": 64, "copper_trapdoor": 64, "cornflower": 64, "cow_spawn_egg": 64, "cracked_deepslate_bricks": 64, "cracked_deepslate_tiles": 64, "cracked_nether_bricks": 64, "cracked_polished_blackstone_bricks": 64, "cracked_stone_bricks": 64, "crafter": 64, "crafting_table": 64, "creaking_heart": 64, "creaking_spawn_egg": 64, "creeper_banner_pattern": 1, "creeper_head": 64, "creeper_spawn_egg": 64, "crimson_button": 64, "crimson_door": 64, "crimson_fence": 64, "crimson_fence_gate": 64, "crimson_fungus": 64, "crimson_hanging_sign": 16, "crimson_hyphae": 64, "crimson_nylium": 64, "crimson_planks": 64, "crimson_pressure_plate": 64, "crimson_roots": 64, "crimson_shelf": 64, "crimson_sign": 16, "crimson_slab": 64, "crimson_stairs": 64, "crimson_stem": 64, "crimson_trapdoor": 64, "crossbow": 1, "crying_obsidian": 64, "cut_copper": 64, "cut_copper_slab": 64, "cut_copper_stairs": 64, "cut_red_sandstone": 64, "cut_red_sandstone_slab": 64, "cut_sandstone": 64, "cut_sandstone_slab": 64, "cyan_banner": 16, "cyan_bed": 1, "cyan_bundle": 1, "cyan_candle": 64, "cyan_carpet": 64, "cyan_concrete": 64, "cyan_concrete_powder": 64, "cyan_concrete_slab": 64, "cyan_concrete_stairs": 64, "cyan_cushion": 16, "cyan_dye": 64, "cyan_glazed_terracotta": 64, "cyan_harness": 1, "cyan_shulker_box": 1, "cyan_stained_glass": 64, "cyan_stained_glass_pane": 64, "cyan_terracotta": 64, "cyan_wool": 64, "cyan_wool_slab": 64, "cyan_wool_stairs": 64, "damaged_anvil": 64, "dandelion": 64, "danger_pottery_sherd": 64, "dark_oak_boat": 1, "dark_oak_button": 64, "dark_oak_chest_boat": 1, "dark_oak_door": 64, "dark_oak_fence": 64, "dark_oak_fence_gate": 64, "dark_oak_hanging_sign": 16, "dark_oak_leaves": 64, "dark_oak_log": 64, "dark_oak_planks": 64, "dark_oak_pressure_plate": 64, "dark_oak_sapling": 64, "dark_oak_shelf": 64, "dark_oak_sign": 16, "dark_oak_slab": 64, "dark_oak_stairs": 64, "dark_oak_trapdoor": 64, "dark_oak_wood": 64, "dark_prismarine": 64, "dark_prismarine_slab": 64, "dark_prismarine_stairs": 64, "daylight_detector": 64, "dead_brain_coral": 64, "dead_brain_coral_block": 64, "dead_brain_coral_fan": 64, "dead_bubble_coral": 64, "dead_bubble_coral_block": 64, "dead_bubble_coral_fan": 64, "dead_bush": 64, "dead_fire_coral": 64, "dead_fire_coral_block": 64, "dead_fire_coral_fan": 64, "dead_horn_coral": 64, "dead_horn_coral_block": 64, "dead_horn_coral_fan": 64, "dead_tube_coral": 64, "dead_tube_coral_block": 64, "dead_tube_coral_fan": 64, "debug_stick": 1, "decorated_pot": 64, "deepslate": 64, "deepslate_brick_slab": 64, "deepslate_brick_stairs": 64, "deepslate_brick_wall": 64, "deepslate_bricks": 64, "deepslate_coal_ore": 64, "deepslate_copper_ore": 64, "deepslate_diamond_ore": 64, "deepslate_emerald_ore": 64, "deepslate_gold_ore": 64, "deepslate_iron_ore": 64, "deepslate_lapis_ore": 64, "deepslate_redstone_ore": 64, "deepslate_tile_slab": 64, "deepslate_tile_stairs": 64, "deepslate_tile_wall": 64, "deepslate_tiles": 64, "desert_pyramid_map": 64, "desert_village_map": 64, "detector_rail": 64, "diamond": 64, "diamond_axe": 1, "diamond_block": 64, "diamond_boots": 1, "diamond_chestplate": 1, "diamond_helmet": 1, "diamond_hoe": 1, "diamond_horse_armor": 1, "diamond_leggings": 1, "diamond_nautilus_armor": 1, "diamond_ore": 64, "diamond_pickaxe": 1, "diamond_shovel": 1, "diamond_spear": 1, "diamond_sword": 1, "diorite": 64, "diorite_slab": 64, "diorite_stairs": 64, "diorite_wall": 64, "dirt": 64, "dirt_path": 64, "disc_fragment_5": 64, "dispenser": 64, "dolphin_spawn_egg": 64, "donkey_spawn_egg": 64, "dragon_breath": 64, "dragon_egg": 64, "dragon_head": 64, "dried_ghast": 64, "dried_kelp": 64, "dried_kelp_block": 64, "dripstone_block": 64, "dropper": 64, "drowned_spawn_egg": 64, "dune_armor_trim_smithing_template": 64, "echo_shard": 64, "egg": 16, "elder_guardian_spawn_egg": 64, "elytra": 1, "emerald": 64, "emerald_block": 64, "emerald_ore": 64, "enchanted_book": 1, "enchanted_golden_apple": 64, "enchanting_table": 64, "end_crystal": 64, "end_portal_frame": 64, "end_rod": 64, "end_stone": 64, "end_stone_brick_slab": 64, "end_stone_brick_stairs": 64, "end_stone_brick_wall": 64, "end_stone_bricks": 64, "ender_chest": 64, "ender_dragon_spawn_egg": 64, "ender_eye": 64, "ender_pearl": 16, "enderman_spawn_egg": 64, "endermite_spawn_egg": 64, "evoker_spawn_egg": 64, "experience_bottle": 64, "explorer_pottery_sherd": 64, "exposed_chiseled_copper": 64, "exposed_copper": 64, "exposed_copper_bars": 64, "exposed_copper_bulb": 64, "exposed_copper_chain": 64, "exposed_copper_chest": 64, "exposed_copper_door": 64, "exposed_copper_golem_statue": 64, "exposed_copper_grate": 64, "exposed_copper_lantern": 64, "exposed_copper_trapdoor": 64, "exposed_cut_copper": 64, "exposed_cut_copper_slab": 64, "exposed_cut_copper_stairs": 64, "exposed_lightning_rod": 64, "eye_armor_trim_smithing_template": 64, "farmland": 64, "feather": 64, "fermented_spider_eye": 64, "fern": 64, "field_masoned_banner_pattern": 1, "filled_map": 64, "fire_charge": 64, "fire_coral": 64, "fire_coral_block": 64, "fire_coral_fan": 64, "firefly_bush": 64, "firework_rocket": 64, "firework_star": 64, "fishing_rod": 1, "fletching_table": 64, "flint": 64, "flint_and_steel": 1, "flow_armor_trim_smithing_template": 64, "flow_banner_pattern": 1, "flow_pottery_sherd": 64, "flower_banner_pattern": 1, "flower_pot": 64, "flowering_azalea": 64, "flowering_azalea_leaves": 64, "fox_spawn_egg": 64, "friend_pottery_sherd": 64, "frog_spawn_egg": 64, "frogspawn": 64, "furnace": 64, "furnace_minecart": 1, "ghast_spawn_egg": 64, "ghast_tear": 64, "gilded_blackstone": 64, "glass": 64, "glass_bottle": 64, "glass_pane": 64, "glistering_melon_slice": 64, "globe_banner_pattern": 1, "glow_berries": 64, "glow_ink_sac": 64, "glow_item_frame": 64, "glow_lichen": 64, "glow_squid_spawn_egg": 64, "glowstone": 64, "glowstone_dust": 64, "goat_horn": 1, "goat_spawn_egg": 64, "gold_block": 64, "gold_ingot": 64, "gold_nugget": 64, "gold_ore": 64, "golden_apple": 64, "golden_axe": 1, "golden_boots": 1, "golden_carrot": 64, "golden_chestplate": 1, "golden_dandelion": 64, "golden_helmet": 1, "golden_hoe": 1, "golden_horse_armor": 1, "golden_leggings": 1, "golden_nautilus_armor": 1, "golden_pickaxe": 1, "golden_shovel": 1, "golden_spear": 1, "golden_sword": 1, "granite": 64, "granite_slab": 64, "granite_stairs": 64, "granite_wall": 64, "grass_block": 64, "gravel": 64, "gray_banner": 16, "gray_bed": 1, "gray_bundle": 1, "gray_candle": 64, "gray_carpet": 64, "gray_concrete": 64, "gray_concrete_powder": 64, "gray_concrete_slab": 64, "gray_concrete_stairs": 64, "gray_cushion": 16, "gray_dye": 64, "gray_glazed_terracotta": 64, "gray_harness": 1, "gray_shulker_box": 1, "gray_stained_glass": 64, "gray_stained_glass_pane": 64, "gray_terracotta": 64, "gray_wool": 64, "gray_wool_slab": 64, "gray_wool_stairs": 64, "green_banner": 16, "green_bed": 1, "green_bundle": 1, "green_candle": 64, "green_carpet": 64, "green_concrete": 64, "green_concrete_powder": 64, "green_concrete_slab": 64, "green_concrete_stairs": 64, "green_cushion": 16, "green_dye": 64, "green_glazed_terracotta": 64, "green_harness": 1, "green_shulker_box": 1, "green_stained_glass": 64, "green_stained_glass_pane": 64, "green_terracotta": 64, "green_wool": 64, "green_wool_slab": 64, "green_wool_stairs": 64, "grindstone": 64, "guardian_spawn_egg": 64, "gunpowder": 64, "guster_banner_pattern": 1, "guster_pottery_sherd": 64, "hanging_roots": 64, "happy_ghast_spawn_egg": 64, "hay_block": 64, "heart_of_the_sea": 64, "heart_pottery_sherd": 64, "heartbreak_pottery_sherd": 64, "heavy_core": 64, "heavy_weighted_pressure_plate": 64, "hoglin_spawn_egg": 64, "honey_block": 64, "honey_bottle": 16, "honeycomb": 64, "honeycomb_block": 64, "hopper": 64, "hopper_minecart": 1, "horn_coral": 64, "horn_coral_block": 64, "horn_coral_fan": 64, "horse_spawn_egg": 64, "host_armor_trim_smithing_template": 64, "howl_pottery_sherd": 64, "husk_spawn_egg": 64, "ice": 64, "infested_chiseled_stone_bricks": 64, "infested_cobblestone": 64, "infested_cracked_stone_bricks": 64, "infested_deepslate": 64, "infested_mossy_stone_bricks": 64, "infested_stone": 64, "infested_stone_bricks": 64, "ink_sac": 64, "iron_axe": 1, "iron_bars": 64, "iron_block": 64, "iron_boots": 1, "iron_chain": 64, "iron_chestplate": 1, "iron_door": 64, "iron_golem_spawn_egg": 64, "iron_helmet": 1, "iron_hoe": 1, "iron_horse_armor": 1, "iron_ingot": 64, "iron_leggings": 1, "iron_nautilus_armor": 1, "iron_nugget": 64, "iron_ore": 64, "iron_pickaxe": 1, "iron_shovel": 1, "iron_spear": 1, "iron_sword": 1, "iron_trapdoor": 64, "item_frame": 64, "jack_o_lantern": 64, "jigsaw": 64, "jukebox": 64, "jungle_boat": 1, "jungle_button": 64, "jungle_chest_boat": 1, "jungle_door": 64, "jungle_fence": 64, "jungle_fence_gate": 64, "jungle_hanging_sign": 16, "jungle_leaves": 64, "jungle_log": 64, "jungle_planks": 64, "jungle_pressure_plate": 64, "jungle_pyramid_map": 64, "jungle_sapling": 64, "jungle_shelf": 64, "jungle_sign": 16, "jungle_slab": 64, "jungle_stairs": 64, "jungle_trapdoor": 64, "jungle_wood": 64, "kelp": 64, "knowledge_book": 1, "ladder": 64, "lantern": 64, "lapis_block": 64, "lapis_lazuli": 64, "lapis_ore": 64, "large_amethyst_bud": 64, "large_fern": 64, "lava_bucket": 1, "lead": 64, "leaf_litter": 64, "leather": 64, "leather_boots": 1, "leather_chestplate": 1, "leather_helmet": 1, "leather_horse_armor": 1, "leather_leggings": 1, "lectern": 64, "lever": 64, "light": 64, "light_blue_banner": 16, "light_blue_bed": 1, "light_blue_bundle": 1, "light_blue_candle": 64, "light_blue_carpet": 64, "light_blue_concrete": 64, "light_blue_concrete_powder": 64, "light_blue_concrete_slab": 64, "light_blue_concrete_stairs": 64, "light_blue_cushion": 16, "light_blue_dye": 64, "light_blue_glazed_terracotta": 64, "light_blue_harness": 1, "light_blue_shulker_box": 1, "light_blue_stained_glass": 64, "light_blue_stained_glass_pane": 64, "light_blue_terracotta": 64, "light_blue_wool": 64, "light_blue_wool_slab": 64, "light_blue_wool_stairs": 64, "light_gray_banner": 16, "light_gray_bed": 1, "light_gray_bundle": 1, "light_gray_candle": 64, "light_gray_carpet": 64, "light_gray_concrete": 64, "light_gray_concrete_powder": 64, "light_gray_concrete_slab": 64, "light_gray_concrete_stairs": 64, "light_gray_cushion": 16, "light_gray_dye": 64, "light_gray_glazed_terracotta": 64, "light_gray_harness": 1, "light_gray_shulker_box": 1, "light_gray_stained_glass": 64, "light_gray_stained_glass_pane": 64, "light_gray_terracotta": 64, "light_gray_wool": 64, "light_gray_wool_slab": 64, "light_gray_wool_stairs": 64, "light_weighted_pressure_plate": 64, "lightning_rod": 64, "lilac": 64, "lily_of_the_valley": 64, "lily_pad": 64, "lime_banner": 16, "lime_bed": 1, "lime_bundle": 1, "lime_candle": 64, "lime_carpet": 64, "lime_concrete": 64, "lime_concrete_powder": 64, "lime_concrete_slab": 64, "lime_concrete_stairs": 64, "lime_cushion": 16, "lime_dye": 64, "lime_glazed_terracotta": 64, "lime_harness": 1, "lime_shulker_box": 1, "lime_stained_glass": 64, "lime_stained_glass_pane": 64, "lime_terracotta": 64, "lime_wool": 64, "lime_wool_slab": 64, "lime_wool_stairs": 64, "lingering_potion": 1, "llama_spawn_egg": 64, "lodestone": 64, "loom": 64, "mace": 1, "magenta_banner": 16, "magenta_bed": 1, "magenta_bundle": 1, "magenta_candle": 64, "magenta_carpet": 64, "magenta_concrete": 64, "magenta_concrete_powder": 64, "magenta_concrete_slab": 64, "magenta_concrete_stairs": 64, "magenta_cushion": 16, "magenta_dye": 64, "magenta_glazed_terracotta": 64, "magenta_harness": 1, "magenta_shulker_box": 1, "magenta_stained_glass": 64, "magenta_stained_glass_pane": 64, "magenta_terracotta": 64, "magenta_wool": 64, "magenta_wool_slab": 64, "magenta_wool_stairs": 64, "magma_block": 64, "magma_cream": 64, "magma_cube_spawn_egg": 64, "mangrove_boat": 1, "mangrove_button": 64, "mangrove_chest_boat": 1, "mangrove_door": 64, "mangrove_fence": 64, "mangrove_fence_gate": 64, "mangrove_hanging_sign": 16, "mangrove_leaves": 64, "mangrove_log": 64, "mangrove_planks": 64, "mangrove_pressure_plate": 64, "mangrove_propagule": 64, "mangrove_roots": 64, "mangrove_shelf": 64, "mangrove_sign": 16, "mangrove_slab": 64, "mangrove_stairs": 64, "mangrove_trapdoor": 64, "mangrove_wood": 64, "map": 64, "medium_amethyst_bud": 64, "melon": 64, "melon_seeds": 64, "melon_slice": 64, "milk_bucket": 1, "minecart": 1, "miner_pottery_sherd": 64, "mojang_banner_pattern": 1, "mooshroom_spawn_egg": 64, "moss_block": 64, "moss_carpet": 64, "mossy_cobblestone": 64, "mossy_cobblestone_slab": 64, "mossy_cobblestone_stairs": 64, "mossy_cobblestone_wall": 64, "mossy_stone_brick_slab": 64, "mossy_stone_brick_stairs": 64, "mossy_stone_brick_wall": 64, "mossy_stone_bricks": 64, "mourner_pottery_sherd": 64, "mud": 64, "mud_brick_slab": 64, "mud_brick_stairs": 64, "mud_brick_wall": 64, "mud_bricks": 64, "muddy_mangrove_roots": 64, "mule_spawn_egg": 64, "mushroom_stem": 64, "mushroom_stew": 1, "music_disc_11": 1, "music_disc_13": 1, "music_disc_5": 1, "music_disc_blocks": 1, "music_disc_bounce": 1, "music_disc_cat": 1, "music_disc_chirp": 1, "music_disc_creator": 1, "music_disc_creator_music_box": 1, "music_disc_far": 1, "music_disc_lava_chicken": 1, "music_disc_mall": 1, "music_disc_mellohi": 1, "music_disc_otherside": 1, "music_disc_pigstep": 1, "music_disc_precipice": 1, "music_disc_relic": 1, "music_disc_stal": 1, "music_disc_strad": 1, "music_disc_tears": 1, "music_disc_wait": 1, "music_disc_ward": 1, "mutton": 64, "mycelium": 64, "name_tag": 64, "nautilus_shell": 64, "nautilus_spawn_egg": 64, "nether_brick": 64, "nether_brick_fence": 64, "nether_brick_slab": 64, "nether_brick_stairs": 64, "nether_brick_wall": 64, "nether_bricks": 64, "nether_gold_ore": 64, "nether_quartz_ore": 64, "nether_sprouts": 64, "nether_star": 64, "nether_wart": 64, "nether_wart_block": 64, "netherite_axe": 1, "netherite_block": 64, "netherite_boots": 1, "netherite_chestplate": 1, "netherite_helmet": 1, "netherite_hoe": 1, "netherite_horse_armor": 1, "netherite_ingot": 64, "netherite_leggings": 1, "netherite_nautilus_armor": 1, "netherite_pickaxe": 1, "netherite_scrap": 64, "netherite_shovel": 1, "netherite_spear": 1, "netherite_sword": 1, "netherite_upgrade_smithing_template": 64, "netherrack": 64, "note_block": 64, "oak_boat": 1, "oak_button": 64, "oak_chest_boat": 1, "oak_door": 64, "oak_fence": 64, "oak_fence_gate": 64, "oak_hanging_sign": 16, "oak_leaves": 64, "oak_log": 64, "oak_planks": 64, "oak_pressure_plate": 64, "oak_sapling": 64, "oak_shelf": 64, "oak_sign": 16, "oak_slab": 64, "oak_stairs": 64, "oak_trapdoor": 64, "oak_wood": 64, "observer": 64, "obsidian": 64, "ocean_monument_map": 64, "ocelot_spawn_egg": 64, "ochre_froglight": 64, "ominous_bottle": 64, "ominous_trial_key": 64, "open_eyeblossom": 64, "orange_banner": 16, "orange_bed": 1, "orange_bundle": 1, "orange_candle": 64, "orange_carpet": 64, "orange_concrete": 64, "orange_concrete_powder": 64, "orange_concrete_slab": 64, "orange_concrete_stairs": 64, "orange_cushion": 16, "orange_dye": 64, "orange_glazed_terracotta": 64, "orange_harness": 1, "orange_poplar_leaves": 64, "orange_shulker_box": 1, "orange_stained_glass": 64, "orange_stained_glass_pane": 64, "orange_terracotta": 64, "orange_tulip": 64, "orange_wool": 64, "orange_wool_slab": 64, "orange_wool_stairs": 64, "oxeye_daisy": 64, "oxidized_chiseled_copper": 64, "oxidized_copper": 64, "oxidized_copper_bars": 64, "oxidized_copper_bulb": 64, "oxidized_copper_chain": 64, "oxidized_copper_chest": 64, "oxidized_copper_door": 64, "oxidized_copper_golem_statue": 64, "oxidized_copper_grate": 64, "oxidized_copper_lantern": 64, "oxidized_copper_trapdoor": 64, "oxidized_cut_copper": 64, "oxidized_cut_copper_slab": 64, "oxidized_cut_copper_stairs": 64, "oxidized_lightning_rod": 64, "packed_ice": 64, "packed_mud": 64, "painting": 64, "pale_hanging_moss": 64, "pale_moss_block": 64, "pale_moss_carpet": 64, "pale_oak_boat": 1, "pale_oak_button": 64, "pale_oak_chest_boat": 1, "pale_oak_door": 64, "pale_oak_fence": 64, "pale_oak_fence_gate": 64, "pale_oak_hanging_sign": 16, "pale_oak_leaves": 64, "pale_oak_log": 64, "pale_oak_planks": 64, "pale_oak_pressure_plate": 64, "pale_oak_sapling": 64, "pale_oak_shelf": 64, "pale_oak_sign": 16, "pale_oak_slab": 64, "pale_oak_stairs": 64, "pale_oak_trapdoor": 64, "pale_oak_wood": 64, "panda_spawn_egg": 64, "paper": 64, "parched_spawn_egg": 64, "parrot_spawn_egg": 64, "pearlescent_froglight": 64, "peony": 64, "petrified_oak_slab": 64, "phantom_membrane": 64, "phantom_spawn_egg": 64, "pig_spawn_egg": 64, "piglin_banner_pattern": 1, "piglin_brute_spawn_egg": 64, "piglin_head": 64, "piglin_spawn_egg": 64, "pillager_spawn_egg": 64, "pink_banner": 16, "pink_bed": 1, "pink_bundle": 1, "pink_candle": 64, "pink_carpet": 64, "pink_concrete": 64, "pink_concrete_powder": 64, "pink_concrete_slab": 64, "pink_concrete_stairs": 64, "pink_cushion": 16, "pink_dye": 64, "pink_glazed_terracotta": 64, "pink_harness": 1, "pink_petals": 64, "pink_shulker_box": 1, "pink_stained_glass": 64, "pink_stained_glass_pane": 64, "pink_terracotta": 64, "pink_tulip": 64, "pink_wool": 64, "pink_wool_slab": 64, "pink_wool_stairs": 64, "piston": 64, "pitcher_plant": 64, "pitcher_pod": 64, "plains_village_map": 64, "player_head": 64, "plenty_pottery_sherd": 64, "podzol": 64, "pointed_dripstone": 64, "poisonous_potato": 64, "polar_bear_spawn_egg": 64, "polished_andesite": 64, "polished_andesite_slab": 64, "polished_andesite_stairs": 64, "polished_basalt": 64, "polished_blackstone": 64, "polished_blackstone_brick_slab": 64, "polished_blackstone_brick_stairs": 64, "polished_blackstone_brick_wall": 64, "polished_blackstone_bricks": 64, "polished_blackstone_button": 64, "polished_blackstone_pressure_plate": 64, "polished_blackstone_slab": 64, "polished_blackstone_stairs": 64, "polished_blackstone_wall": 64, "polished_cinnabar": 64, "polished_cinnabar_slab": 64, "polished_cinnabar_stairs": 64, "polished_cinnabar_wall": 64, "polished_deepslate": 64, "polished_deepslate_slab": 64, "polished_deepslate_stairs": 64, "polished_deepslate_wall": 64, "polished_diorite": 64, "polished_diorite_slab": 64, "polished_diorite_stairs": 64, "polished_granite": 64, "polished_granite_slab": 64, "polished_granite_stairs": 64, "polished_sulfur": 64, "polished_sulfur_slab": 64, "polished_sulfur_stairs": 64, "polished_sulfur_wall": 64, "polished_tuff": 64, "polished_tuff_slab": 64, "polished_tuff_stairs": 64, "polished_tuff_wall": 64, "poplar_boat": 1, "poplar_button": 64, "poplar_chest_boat": 1, "poplar_door": 64, "poplar_fence": 64, "poplar_fence_gate": 64, "poplar_hanging_sign": 16, "poplar_log": 64, "poplar_planks": 64, "poplar_pressure_plate": 64, "poplar_sapling": 64, "poplar_shelf": 64, "poplar_sign": 16, "poplar_slab": 64, "poplar_stairs": 64, "poplar_trapdoor": 64, "poplar_wood": 64, "popped_chorus_fruit": 64, "poppy": 64, "porkchop": 64, "potato": 64, "potent_sulfur": 64, "potion": 1, "powder_snow_bucket": 1, "powered_rail": 64, "prismarine": 64, "prismarine_brick_slab": 64, "prismarine_brick_stairs": 64, "prismarine_bricks": 64, "prismarine_crystals": 64, "prismarine_shard": 64, "prismarine_slab": 64, "prismarine_stairs": 64, "prismarine_wall": 64, "prize_pottery_sherd": 64, "pufferfish": 64, "pufferfish_bucket": 1, "pufferfish_spawn_egg": 64, "pumpkin": 64, "pumpkin_pie": 64, "pumpkin_seeds": 64, "purple_banner": 16, "purple_bed": 1, "purple_bundle": 1, "purple_candle": 64, "purple_carpet": 64, "purple_concrete": 64, "purple_concrete_powder": 64, "purple_concrete_slab": 64, "purple_concrete_stairs": 64, "purple_cushion": 16, "purple_dye": 64, "purple_glazed_terracotta": 64, "purple_harness": 1, "purple_shulker_box": 1, "purple_stained_glass": 64, "purple_stained_glass_pane": 64, "purple_terracotta": 64, "purple_wool": 64, "purple_wool_slab": 64, "purple_wool_stairs": 64, "purpur_block": 64, "purpur_pillar": 64, "purpur_slab": 64, "purpur_stairs": 64, "quartz": 64, "quartz_block": 64, "quartz_bricks": 64, "quartz_pillar": 64, "quartz_slab": 64, "quartz_stairs": 64, "rabbit": 64, "rabbit_foot": 64, "rabbit_hide": 64, "rabbit_spawn_egg": 64, "rabbit_stew": 1, "rail": 64, "raiser_armor_trim_smithing_template": 64, "ravager_spawn_egg": 64, "raw_copper": 64, "raw_copper_block": 64, "raw_gold": 64, "raw_gold_block": 64, "raw_iron": 64, "raw_iron_block": 64, "recovery_compass": 64, "red_banner": 16, "red_bed": 1, "red_bundle": 1, "red_candle": 64, "red_carpet": 64, "red_concrete": 64, "red_concrete_powder": 64, "red_concrete_slab": 64, "red_concrete_stairs": 64, "red_cushion": 16, "red_dye": 64, "red_glazed_terracotta": 64, "red_harness": 1, "red_mushroom": 64, "red_mushroom_block": 64, "red_nether_brick_slab": 64, "red_nether_brick_stairs": 64, "red_nether_brick_wall": 64, "red_nether_bricks": 64, "red_poplar_leaves": 64, "red_sand": 64, "red_sandstone": 64, "red_sandstone_slab": 64, "red_sandstone_stairs": 64, "red_sandstone_wall": 64, "red_shrub": 64, "red_shulker_box": 1, "red_stained_glass": 64, "red_stained_glass_pane": 64, "red_terracotta": 64, "red_tulip": 64, "red_wool": 64, "red_wool_slab": 64, "red_wool_stairs": 64, "redstone": 64, "redstone_block": 64, "redstone_lamp": 64, "redstone_ore": 64, "redstone_torch": 64, "reinforced_deepslate": 64, "repeater": 64, "repeating_command_block": 64, "resin_block": 64, "resin_brick": 64, "resin_brick_slab": 64, "resin_brick_stairs": 64, "resin_brick_wall": 64, "resin_bricks": 64, "resin_clump": 64, "respawn_anchor": 64, "rib_armor_trim_smithing_template": 64, "rooted_dirt": 64, "rose_bush": 64, "rotten_flesh": 64, "saddle": 1, "salmon": 64, "salmon_bucket": 1, "salmon_spawn_egg": 64, "sand": 64, "sandstone": 64, "sandstone_slab": 64, "sandstone_stairs": 64, "sandstone_wall": 64, "savanna_village_map": 64, "scaffolding": 64, "scrape_pottery_sherd": 64, "sculk": 64, "sculk_catalyst": 64, "sculk_sensor": 64, "sculk_shrieker": 64, "sculk_vein": 64, "sea_lantern": 64, "sea_pickle": 64, "seagrass": 64, "sentry_armor_trim_smithing_template": 64, "shaper_armor_trim_smithing_template": 64, "sheaf_pottery_sherd": 64, "shears": 1, "sheep_spawn_egg": 64, "shelf_mushroom": 64, "shelter_pottery_sherd": 64, "shield": 1, "short_dry_grass": 64, "short_grass": 64, "shroomlight": 64, "shulker_box": 1, "shulker_shell": 64, "shulker_spawn_egg": 64, "silence_armor_trim_smithing_template": 64, "silverfish_spawn_egg": 64, "skeleton_horse_spawn_egg": 64, "skeleton_skull": 64, "skeleton_spawn_egg": 64, "skull_banner_pattern": 1, "skull_pottery_sherd": 64, "slime_ball": 64, "slime_block": 64, "slime_spawn_egg": 64, "small_amethyst_bud": 64, "small_dripleaf": 64, "smithing_table": 64, "smoker": 64, "smooth_basalt": 64, "smooth_quartz": 64, "smooth_quartz_slab": 64, "smooth_quartz_stairs": 64, "smooth_red_sandstone": 64, "smooth_red_sandstone_slab": 64, "smooth_red_sandstone_stairs": 64, "smooth_sandstone": 64, "smooth_sandstone_slab": 64, "smooth_sandstone_stairs": 64, "smooth_stone": 64, "smooth_stone_slab": 64, "sniffer_egg": 64, "sniffer_spawn_egg": 64, "snort_pottery_sherd": 64, "snout_armor_trim_smithing_template": 64, "snow": 64, "snow_block": 64, "snow_golem_spawn_egg": 64, "snowball": 16, "snowy_village_map": 64, "soul_campfire": 64, "soul_lantern": 64, "soul_sand": 64, "soul_soil": 64, "soul_torch": 64, "spawner": 64, "spectral_arrow": 64, "spider_eye": 64, "spider_spawn_egg": 64, "spire_armor_trim_smithing_template": 64, "splash_potion": 1, "sponge": 64, "spore_blossom": 64, "spruce_boat": 1, "spruce_button": 64, "spruce_chest_boat": 1, "spruce_door": 64, "spruce_fence": 64, "spruce_fence_gate": 64, "spruce_hanging_sign": 16, "spruce_leaves": 64, "spruce_log": 64, "spruce_planks": 64, "spruce_pressure_plate": 64, "spruce_sapling": 64, "spruce_shelf": 64, "spruce_sign": 16, "spruce_slab": 64, "spruce_stairs": 64, "spruce_trapdoor": 64, "spruce_wood": 64, "spyglass": 1, "squid_spawn_egg": 64, "stick": 64, "sticky_piston": 64, "stone": 64, "stone_axe": 1, "stone_brick_slab": 64, "stone_brick_stairs": 64, "stone_brick_wall": 64, "stone_bricks": 64, "stone_button": 64, "stone_hoe": 1, "stone_pickaxe": 1, "stone_pressure_plate": 64, "stone_shovel": 1, "stone_slab": 64, "stone_spear": 1, "stone_stairs": 64, "stone_sword": 1, "stonecutter": 64, "straw_bed": 16, "stray_spawn_egg": 64, "strider_spawn_egg": 64, "string": 64, "stripped_acacia_log": 64, "stripped_acacia_wood": 64, "stripped_bamboo_block": 64, "stripped_birch_log": 64, "stripped_birch_wood": 64, "stripped_cherry_log": 64, "stripped_cherry_wood": 64, "stripped_crimson_hyphae": 64, "stripped_crimson_stem": 64, "stripped_dark_oak_log": 64, "stripped_dark_oak_wood": 64, "stripped_jungle_log": 64, "stripped_jungle_wood": 64, "stripped_mangrove_log": 64, "stripped_mangrove_wood": 64, "stripped_oak_log": 64, "stripped_oak_wood": 64, "stripped_pale_oak_log": 64, "stripped_pale_oak_wood": 64, "stripped_poplar_log": 64, "stripped_poplar_wood": 64, "stripped_spruce_log": 64, "stripped_spruce_wood": 64, "stripped_warped_hyphae": 64, "stripped_warped_stem": 64, "structure_block": 64, "structure_void": 64, "sugar": 64, "sugar_cane": 64, "sulfur": 64, "sulfur_brick_slab": 64, "sulfur_brick_stairs": 64, "sulfur_brick_wall": 64, "sulfur_bricks": 64, "sulfur_cube_bucket": 1, "sulfur_cube_spawn_egg": 64, "sulfur_slab": 64, "sulfur_spike": 64, "sulfur_stairs": 64, "sulfur_wall": 64, "sunflower": 64, "suspicious_gravel": 64, "suspicious_sand": 64, "suspicious_stew": 1, "swamp_hut_map": 64, "sweet_berries": 64, "tadpole_bucket": 1, "tadpole_spawn_egg": 64, "taiga_village_map": 64, "tall_dry_grass": 64, "tall_grass": 64, "target": 64, "terracotta": 64, "test_block": 64, "test_instance_block": 64, "tide_armor_trim_smithing_template": 64, "tinted_glass": 64, "tipped_arrow": 64, "tnt": 64, "tnt_minecart": 1, "torch": 64, "torchflower": 64, "torchflower_seeds": 64, "totem_of_undying": 1, "trader_llama_spawn_egg": 64, "trapped_chest": 64, "trial_key": 64, "trial_spawner": 64, "trident": 1, "tripwire_hook": 64, "tropical_fish": 64, "tropical_fish_bucket": 1, "tropical_fish_spawn_egg": 64, "tube_coral": 64, "tube_coral_block": 64, "tube_coral_fan": 64, "tuff": 64, "tuff_brick_slab": 64, "tuff_brick_stairs": 64, "tuff_brick_wall": 64, "tuff_bricks": 64, "tuff_slab": 64, "tuff_stairs": 64, "tuff_wall": 64, "turtle_egg": 64, "turtle_helmet": 1, "turtle_scute": 64, "turtle_spawn_egg": 64, "twisting_vines": 64, "vault": 64, "verdant_froglight": 64, "vex_armor_trim_smithing_template": 64, "vex_spawn_egg": 64, "villager_spawn_egg": 64, "vindicator_spawn_egg": 64, "vine": 64, "wandering_trader_spawn_egg": 64, "ward_armor_trim_smithing_template": 64, "warden_spawn_egg": 64, "warm_ocean_ruins_map": 64, "warped_button": 64, "warped_door": 64, "warped_fence": 64, "warped_fence_gate": 64, "warped_fungus": 64, "warped_fungus_on_a_stick": 1, "warped_hanging_sign": 16, "warped_hyphae": 64, "warped_nylium": 64, "warped_planks": 64, "warped_pressure_plate": 64, "warped_roots": 64, "warped_shelf": 64, "warped_sign": 16, "warped_slab": 64, "warped_stairs": 64, "warped_stem": 64, "warped_trapdoor": 64, "warped_wart_block": 64, "water_bucket": 1, "waxed_chiseled_copper": 64, "waxed_copper_bars": 64, "waxed_copper_block": 64, "waxed_copper_bulb": 64, "waxed_copper_chain": 64, "waxed_copper_chest": 64, "waxed_copper_door": 64, "waxed_copper_golem_statue": 64, "waxed_copper_grate": 64, "waxed_copper_lantern": 64, "waxed_copper_trapdoor": 64, "waxed_cut_copper": 64, "waxed_cut_copper_slab": 64, "waxed_cut_copper_stairs": 64, "waxed_exposed_chiseled_copper": 64, "waxed_exposed_copper": 64, "waxed_exposed_copper_bars": 64, "waxed_exposed_copper_bulb": 64, "waxed_exposed_copper_chain": 64, "waxed_exposed_copper_chest": 64, "waxed_exposed_copper_door": 64, "waxed_exposed_copper_golem_statue": 64, "waxed_exposed_copper_grate": 64, "waxed_exposed_copper_lantern": 64, "waxed_exposed_copper_trapdoor": 64, "waxed_exposed_cut_copper": 64, "waxed_exposed_cut_copper_slab": 64, "waxed_exposed_cut_copper_stairs": 64, "waxed_exposed_lightning_rod": 64, "waxed_lightning_rod": 64, "waxed_oxidized_chiseled_copper": 64, "waxed_oxidized_copper": 64, "waxed_oxidized_copper_bars": 64, "waxed_oxidized_copper_bulb": 64, "waxed_oxidized_copper_chain": 64, "waxed_oxidized_copper_chest": 64, "waxed_oxidized_copper_door": 64, "waxed_oxidized_copper_golem_statue": 64, "waxed_oxidized_copper_grate": 64, "waxed_oxidized_copper_lantern": 64, "waxed_oxidized_copper_trapdoor": 64, "waxed_oxidized_cut_copper": 64, "waxed_oxidized_cut_copper_slab": 64, "waxed_oxidized_cut_copper_stairs": 64, "waxed_oxidized_lightning_rod": 64, "waxed_weathered_chiseled_copper": 64, "waxed_weathered_copper": 64, "waxed_weathered_copper_bars": 64, "waxed_weathered_copper_bulb": 64, "waxed_weathered_copper_chain": 64, "waxed_weathered_copper_chest": 64, "waxed_weathered_copper_door": 64, "waxed_weathered_copper_golem_statue": 64, "waxed_weathered_copper_grate": 64, "waxed_weathered_copper_lantern": 64, "waxed_weathered_copper_trapdoor": 64, "waxed_weathered_cut_copper": 64, "waxed_weathered_cut_copper_slab": 64, "waxed_weathered_cut_copper_stairs": 64, "waxed_weathered_lightning_rod": 64, "wayfinder_armor_trim_smithing_template": 64, "weathered_chiseled_copper": 64, "weathered_copper": 64, "weathered_copper_bars": 64, "weathered_copper_bulb": 64, "weathered_copper_chain": 64, "weathered_copper_chest": 64, "weathered_copper_door": 64, "weathered_copper_golem_statue": 64, "weathered_copper_grate": 64, "weathered_copper_lantern": 64, "weathered_copper_trapdoor": 64, "weathered_cut_copper": 64, "weathered_cut_copper_slab": 64, "weathered_cut_copper_stairs": 64, "weathered_lightning_rod": 64, "weeping_vines": 64, "wet_sponge": 64, "wheat": 64, "wheat_seeds": 64, "white_banner": 16, "white_bed": 1, "white_bundle": 1, "white_candle": 64, "white_carpet": 64, "white_concrete": 64, "white_concrete_powder": 64, "white_concrete_slab": 64, "white_concrete_stairs": 64, "white_cushion": 16, "white_dye": 64, "white_glazed_terracotta": 64, "white_harness": 1, "white_shulker_box": 1, "white_stained_glass": 64, "white_stained_glass_pane": 64, "white_terracotta": 64, "white_tulip": 64, "white_wool": 64, "white_wool_slab": 64, "white_wool_stairs": 64, "wild_armor_trim_smithing_template": 64, "wildflowers": 64, "wind_charge": 64, "witch_spawn_egg": 64, "wither_rose": 64, "wither_skeleton_skull": 64, "wither_skeleton_spawn_egg": 64, "wither_spawn_egg": 64, "wolf_armor": 1, "wolf_spawn_egg": 64, "wooden_axe": 1, "wooden_hoe": 1, "wooden_pickaxe": 1, "wooden_shovel": 1, "wooden_spear": 1, "wooden_sword": 1, "woodland_mansion_map": 64, "writable_book": 1, "written_book": 16, "yellow_banner": 16, "yellow_bed": 1, "yellow_bundle": 1, "yellow_candle": 64, "yellow_carpet": 64, "yellow_concrete": 64, "yellow_concrete_powder": 64, "yellow_concrete_slab": 64, "yellow_concrete_stairs": 64, "yellow_cushion": 16, "yellow_dye": 64, "yellow_glazed_terracotta": 64, "yellow_harness": 1, "yellow_poplar_leaves": 64, "yellow_shulker_box": 1, "yellow_stained_glass": 64, "yellow_stained_glass_pane": 64, "yellow_terracotta": 64, "yellow_wool": 64, "yellow_wool_slab": 64, "yellow_wool_stairs": 64, "zoglin_spawn_egg": 64, "zombie_head": 64, "zombie_horse_spawn_egg": 64, "zombie_nautilus_spawn_egg": 64, "zombie_spawn_egg": 64, "zombie_villager_spawn_egg": 64, "zombified_piglin_spawn_egg": 64}  # item id -> max stack size (Minecraft 26.3)

# ---------------------------------------------------------------------------
# Wandering trader alert
# ---------------------------------------------------------------------------
fn("trader/scan", """
    execute as @e[type=minecraft:wandering_trader,tag=!tmf.wt] at @s run function tmf:trader/new
""")
fn("trader/new", """
    tag @s add tmf.wt
    execute store result score #tx tmf.tmp run data get entity @s Pos[0] 10
    execute store result score #tz tmf.tmp run data get entity @s Pos[2] 10
    execute as @a[distance=..200,tag=tmf.on.trader_alert] run function tmf:trader/tell
""")
fn("trader/tell", "\n".join([
    "scoreboard players operation #dx tmf.tmp = #tx tmf.tmp",
    "scoreboard players operation #dx tmf.tmp -= @s tmf.px",
    "scoreboard players operation #dz tmf.tmp = #tz tmf.tmp",
    "scoreboard players operation #dz tmf.tmp -= @s tmf.pz",
    "scoreboard players operation #ax tmf.tmp = #dx tmf.tmp",
    "execute if score #ax tmf.tmp matches ..-1 run scoreboard players operation #ax tmf.tmp *= #m1 tmf.c",
    "scoreboard players operation #az tmf.tmp = #dz tmf.tmp",
    "execute if score #az tmf.tmp matches ..-1 run scoreboard players operation #az tmf.tmp *= #m1 tmf.c",
    # distance ~ max + 0.4*min
    "scoreboard players operation #big tmf.tmp = #ax tmf.tmp",
    "scoreboard players operation #big tmf.tmp > #az tmf.tmp",
    "scoreboard players operation #small tmf.tmp = #ax tmf.tmp",
    "scoreboard players operation #small tmf.tmp < #az tmf.tmp",
    "scoreboard players operation #small tmf.tmp *= #2 tmf.c",
    "scoreboard players operation #small tmf.tmp /= #5 tmf.c",
    "scoreboard players operation #big tmf.tmp += #small tmf.tmp",
    "scoreboard players operation #big tmf.tmp /= #10 tmf.c",
    'data modify storage tmf:tmp tr set value {ns:"",ew:""}',
    "scoreboard players operation #a2 tmf.tmp = #ax tmf.tmp",
    "scoreboard players operation #a2 tmf.tmp *= #2 tmf.c",
    "scoreboard players operation #z2 tmf.tmp = #az tmf.tmp",
    "scoreboard players operation #z2 tmf.tmp *= #2 tmf.c",
    'execute if score #dz tmf.tmp matches ..-1 unless score #z2 tmf.tmp < #ax tmf.tmp run data modify storage tmf:tmp tr.ns set value "north"',
    'execute if score #dz tmf.tmp matches 1.. unless score #z2 tmf.tmp < #ax tmf.tmp run data modify storage tmf:tmp tr.ns set value "south"',
    'execute if score #dx tmf.tmp matches 1.. unless score #a2 tmf.tmp < #az tmf.tmp run data modify storage tmf:tmp tr.ew set value "east"',
    'execute if score #dx tmf.tmp matches ..-1 unless score #a2 tmf.tmp < #az tmf.tmp run data modify storage tmf:tmp tr.ew set value "west"',
    "execute store result storage tmf:tmp tr.d int 1 run scoreboard players get #big tmf.tmp",
    "function tmf:trader/tell_m with storage tmf:tmp tr",
    "playsound minecraft:entity.wandering_trader.ambient player @s ~ ~ ~ 0.6 1",
]))
fn("trader/tell_m", """
    $tellraw @s [{text:"🧳 ",color:"aqua"},{text:"A wandering trader appeared about ",color:"gray"},{text:"$(d) blocks $(ns)$(ew)",color:"aqua"},{text:" of you.",color:"gray"}]
""")

# ---------------------------------------------------------------------------
# Sort chest (sneak + right-click with empty hands)
# ---------------------------------------------------------------------------
js(f"data/{NS}/tags/block/sortable.json", {"values": ["minecraft:chest", "minecraft:trapped_chest", "minecraft:barrel"]})
js(f"data/{NS}/tags/block/chests.json", {"values": ["minecraft:chest", "minecraft:trapped_chest"]})
adv("sort/use", "default_block_use", {
    "player": entity_pred({"minecraft:flags": {"is_sneaking": True}}),
    "location": {"type": "minecraft:location_check", "predicate": {"block": {"blocks": "#tmf:sortable"}}}
}, "sort/use")
fn("sort/use", """
    advancement revoke @s only tmf:sort/use
    execute unless score #sort_chest tmf.cfg matches 1 run return 0
    execute unless entity @s[tag=tmf.on.sort_chest] run return 0
    execute if items entity @s weapon.mainhand * run return 0
    scoreboard players set #r tmf.tmp 0
    execute at @s anchored eyes positioned ^ ^ ^ run function tmf:sort/ray
""")
fn("sort/ray", """
    execute if block ~ ~ ~ #tmf:sortable align xyz run return run function tmf:sort/found
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..55 positioned ^ ^ ^0.1 run function tmf:sort/ray
""")
CW = {"north": (1, 0), "east": (0, 1), "south": (-1, 0), "west": (0, -1)}
CCW = {"north": (-1, 0), "east": (0, -1), "south": (1, 0), "west": (0, 1)}
found = ['data modify storage tmf:tmp sc set value {in:[],work:[],sorted:[],merged:[],first:[],second:[]}',
         'execute if block ~ ~ ~ minecraft:barrel run return run function tmf:sort/single',
         'execute if block ~ ~ ~ #tmf:chests[type=single] run return run function tmf:sort/single']
for f in ("north", "east", "south", "west"):
    # clicked RIGHT half = first half; partner (second) is counter-clockwise of facing
    dx, dz = CCW[f]
    found.append(f'execute if block ~ ~ ~ #tmf:chests[type=right,facing={f}] run return run function tmf:sort/double {{sx:{dx},sz:{dz}}}')
    # clicked LEFT half: partner (first) is clockwise of facing; second = clicked = partner + ccw
    dx, dz = CW[f]
    bx, bz = -dx, -dz
    found.append(f'execute if block ~ ~ ~ #tmf:chests[type=left,facing={f}] positioned ~{dx} ~ ~{dz} run return run function tmf:sort/double {{sx:{bx},sz:{bz}}}')
fn("sort/found", "\n".join(found))
fn("sort/single", """
    data modify storage tmf:tmp sc.in set from block ~ ~ ~ Items
    function tmf:sort/run
    data modify block ~ ~ ~ Items set from storage tmf:tmp sc.first
    function tmf:sort/done
""")
fn("sort/double", """
    data modify storage tmf:tmp sc.in set from block ~ ~ ~ Items
    $data modify storage tmf:tmp sc.in append from block ~$(sx) ~ ~$(sz) Items[]
    function tmf:sort/run
    data modify block ~ ~ ~ Items set from storage tmf:tmp sc.first
    $data modify block ~$(sx) ~ ~$(sz) Items set from storage tmf:tmp sc.second
    function tmf:sort/done
""")
fn("sort/done", """
    playsound minecraft:item.bundle.insert block @a ~ ~ ~ 0.8 1.2
    function tmf:util/actionbar_cd
    title @s actionbar {text:"✔ Sorted",color:"green"}
""")
fn("sort/run", """
    execute if data storage tmf:tmp sc.in[0] run function tmf:sort/annotate
    execute if data storage tmf:tmp sc.work[0] run function tmf:sort/extract
    execute if data storage tmf:tmp sc.sorted[0] run function tmf:sort/merge
    scoreboard players set #slot tmf.tmp 0
    execute if data storage tmf:tmp sc.merged[0] run function tmf:sort/assign
""")
fn("sort/annotate", """
    data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.in[0]
    data remove storage tmf:tmp sc.in[0]
    data remove storage tmf:tmp sc.cur.Slot
    execute unless data storage tmf:tmp sc.cur.count run data modify storage tmf:tmp sc.cur.count set value 1
    function tmf:sort/rank with storage tmf:tmp sc.cur
    execute if data storage tmf:tmp sc.cur.components."minecraft:max_stack_size" run data modify storage tmf:tmp sc.cur.m set from storage tmf:tmp sc.cur.components."minecraft:max_stack_size"
    data modify storage tmf:tmp sc.work append from storage tmf:tmp sc.cur
    execute if data storage tmf:tmp sc.in[0] run function tmf:sort/annotate
""")
fn("sort/rank", """
    data modify storage tmf:tmp sc.cur.r set value 99999
    data modify storage tmf:tmp sc.cur.m set value 64
    $data modify storage tmf:tmp sc.cur.r set from storage tmf:data rank."$(id)".r
    $data modify storage tmf:tmp sc.cur.m set from storage tmf:data rank."$(id)".m
""")
fn("sort/extract", """
    data modify storage tmf:tmp sc.hold set from storage tmf:tmp sc.work[0]
    data remove storage tmf:tmp sc.work[0]
    data modify storage tmf:tmp sc.rest set value []
    execute store result score #hr tmf.tmp run data get storage tmf:tmp sc.hold.r
    execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
    data modify storage tmf:tmp sc.sorted append from storage tmf:tmp sc.hold
    data modify storage tmf:tmp sc.work set from storage tmf:tmp sc.rest
    execute if data storage tmf:tmp sc.work[0] run function tmf:sort/extract
""")
fn("sort/scan", """
    data modify storage tmf:tmp sc.e set from storage tmf:tmp sc.work[0]
    data remove storage tmf:tmp sc.work[0]
    execute store result score #er tmf.tmp run data get storage tmf:tmp sc.e.r
    execute if score #er tmf.tmp < #hr tmf.tmp run return run function tmf:sort/swap_hold
    data modify storage tmf:tmp sc.rest append from storage tmf:tmp sc.e
    execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
""")
fn("sort/swap_hold", """
    data modify storage tmf:tmp sc.rest append from storage tmf:tmp sc.hold
    data modify storage tmf:tmp sc.hold set from storage tmf:tmp sc.e
    scoreboard players operation #hr tmf.tmp = #er tmf.tmp
    execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
""")
fn("sort/merge", """
    data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.sorted[0]
    data remove storage tmf:tmp sc.sorted[0]
    function tmf:sort/merge_one
    execute if data storage tmf:tmp sc.sorted[0] run function tmf:sort/merge
""")
fn("sort/merge_one", """
    execute unless data storage tmf:tmp sc.merged[0] run return run data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
    function tmf:sort/try_merge
""")
fn("sort/try_merge", """
    data modify storage tmf:tmp sc.a set from storage tmf:tmp sc.merged[-1]
    data modify storage tmf:tmp sc.b set from storage tmf:tmp sc.cur
    data remove storage tmf:tmp sc.a.count
    data remove storage tmf:tmp sc.b.count
    execute store success score #diff tmf.tmp run data modify storage tmf:tmp sc.a set from storage tmf:tmp sc.b
    execute if score #diff tmf.tmp matches 1 run return run data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
    execute store result score #pc tmf.tmp run data get storage tmf:tmp sc.merged[-1].count
    execute store result score #cc tmf.tmp run data get storage tmf:tmp sc.cur.count
    execute store result score #mx tmf.tmp run data get storage tmf:tmp sc.cur.m
    scoreboard players operation #space tmf.tmp = #mx tmf.tmp
    scoreboard players operation #space tmf.tmp -= #pc tmf.tmp
    execute if score #space tmf.tmp matches ..0 run return run data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
    scoreboard players operation #mv tmf.tmp = #space tmf.tmp
    scoreboard players operation #mv tmf.tmp < #cc tmf.tmp
    scoreboard players operation #pc tmf.tmp += #mv tmf.tmp
    scoreboard players operation #cc tmf.tmp -= #mv tmf.tmp
    execute store result storage tmf:tmp sc.merged[-1].count int 1 run scoreboard players get #pc tmf.tmp
    execute if score #cc tmf.tmp matches ..0 run return 0
    execute store result storage tmf:tmp sc.cur.count int 1 run scoreboard players get #cc tmf.tmp
    data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
""")
fn("sort/assign", """
    data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.merged[0]
    data remove storage tmf:tmp sc.merged[0]
    data remove storage tmf:tmp sc.cur.r
    data remove storage tmf:tmp sc.cur.m
    execute if score #slot tmf.tmp matches ..26 run function tmf:sort/to_first
    execute if score #slot tmf.tmp matches 27.. run function tmf:sort/to_second
    scoreboard players add #slot tmf.tmp 1
    execute if data storage tmf:tmp sc.merged[0] run function tmf:sort/assign
""")
fn("sort/to_first", """
    execute store result storage tmf:tmp sc.cur.Slot byte 1 run scoreboard players get #slot tmf.tmp
    data modify storage tmf:tmp sc.first append from storage tmf:tmp sc.cur
""")
fn("sort/to_second", """
    scoreboard players operation #s2 tmf.tmp = #slot tmf.tmp
    scoreboard players remove #s2 tmf.tmp 27
    execute store result storage tmf:tmp sc.cur.Slot byte 1 run scoreboard players get #s2 tmf.tmp
    data modify storage tmf:tmp sc.second append from storage tmf:tmp sc.cur
""")
_rank = {}
for i, (iid, mx) in enumerate(sorted(_ITEMS.items())):
    _rank["minecraft:" + iid] = (i, mx)
RANK_SNBT = "{" + ",".join(f'"{k}":{{r:{r},m:{m}}}' for k, (r, m) in _rank.items()) + "}"
fn("sort/init_rank", "data modify storage tmf:data rank set value " + RANK_SNBT)

# ---------------------------------------------------------------------------
# Pickup notices (inventory diff)
# ---------------------------------------------------------------------------
adv("pickup/changed", "inventory_changed", None, "pickup/changed")
fn("pickup/changed", """
    advancement revoke @s only tmf:pickup/changed
    tag @s add tmf.invdirty
""")
fn("pickup/process", """
    tag @s remove tmf.invdirty
    data modify storage tmf:tmp pk set value {inv:[],new:{},list:[],gain:[],lines:[],pid:0}
    data modify storage tmf:tmp pk.inv set from entity @s Inventory
    execute store result storage tmf:tmp pk.pid int 1 run scoreboard players get @s tmf.id
    execute if data storage tmf:tmp pk.inv[0] run function tmf:pickup/agg
    function tmf:pickup/load_old with storage tmf:tmp pk
    scoreboard players set #shown tmf.tmp 0
    execute if data storage tmf:tmp pk.old if entity @s[gamemode=!creative,gamemode=!spectator] if data storage tmf:tmp pk.list[0] run function tmf:pickup/diff
    function tmf:pickup/save with storage tmf:tmp pk
    execute if score #shown tmf.tmp matches 1.. run function tmf:pickup/show
""")
fn("pickup/agg", """
    data modify storage tmf:tmp pk.cur set from storage tmf:tmp pk.inv[0]
    data remove storage tmf:tmp pk.inv[0]
    execute unless data storage tmf:tmp pk.cur.count run data modify storage tmf:tmp pk.cur.count set value 1
    function tmf:pickup/agg_m with storage tmf:tmp pk.cur
    execute if data storage tmf:tmp pk.inv[0] run function tmf:pickup/agg
""")
fn("pickup/agg_m", """
    $execute unless data storage tmf:tmp pk.new."$(id)" run data modify storage tmf:tmp pk.list append value {id:"$(id)"}
    $execute store result score #c tmf.tmp run data get storage tmf:tmp pk.new."$(id)"
    $scoreboard players add #c tmf.tmp $(count)
    $execute store result storage tmf:tmp pk.new."$(id)" int 1 run scoreboard players get #c tmf.tmp
""")
fn("pickup/load_old", """
    data remove storage tmf:tmp pk.old
    $data modify storage tmf:tmp pk.old set from storage tmf:pk p$(pid)
""")
fn("pickup/save", """
    $data modify storage tmf:pk p$(pid) set from storage tmf:tmp pk.new
""")
fn("pickup/diff", """
    data modify storage tmf:tmp pk.e set from storage tmf:tmp pk.list[0]
    data remove storage tmf:tmp pk.list[0]
    function tmf:pickup/diff_m with storage tmf:tmp pk.e
    execute if data storage tmf:tmp pk.list[0] run function tmf:pickup/diff
""")
fn("pickup/diff_m", """
    $execute store result score #nc tmf.tmp run data get storage tmf:tmp pk.new."$(id)"
    $execute store result score #oc tmf.tmp run data get storage tmf:tmp pk.old."$(id)"
    scoreboard players operation #nc tmf.tmp -= #oc tmf.tmp
    execute if score #nc tmf.tmp matches ..0 run return 0
    scoreboard players add #shown tmf.tmp 1
    execute if score #shown tmf.tmp matches 5.. run return 0
    execute store result storage tmf:tmp pk.e.n int 1 run scoreboard players get #nc tmf.tmp
    data modify storage tmf:tmp pk.e.p set string storage tmf:tmp pk.e.id 10
    function tmf:pickup/line with storage tmf:tmp pk.e
""")
fn("pickup/line", """
    $data modify storage tmf:tmp pk.lines append value {text:"+$(n) ",color:"green",extra:[{translate:"item.minecraft.$(p)",fallback:"%s",with:[{translate:"block.minecraft.$(p)",fallback:"$(p)"}],color:"gray"}]}
""")
fn("pickup/show", """
    execute if score #shown tmf.tmp matches 5.. run data modify storage tmf:tmp pk.lines append value {text:"…",color:"dark_gray"}
    scoreboard players set @s tmf.abt 30
    title @s actionbar {nbt:"pk.lines[]",storage:"tmf:tmp",interpret:true,separator:{text:"   "}}
""")

# ---------------------------------------------------------------------------
# Magnet
# ---------------------------------------------------------------------------
fn("magnet/dropped", """
    scoreboard players set @s tmf.drop 0
    execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:0s} run tag @s add tmf.nomag
    execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:1s} run tag @s add tmf.nomag
    execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:2s} run tag @s add tmf.nomag
""")
fn("magnet/pull", """
    tag @s add tmf.mag_me
    execute as @e[type=minecraft:item,distance=1.2..7,tag=!tmf.nomag] at @s facing entity @a[tag=tmf.mag_me,limit=1] feet run tp @s ^ ^ ^0.35
    execute as @e[type=minecraft:experience_orb,distance=1.2..7] at @s facing entity @a[tag=tmf.mag_me,limit=1] feet run tp @s ^ ^ ^0.35
    tag @s remove tmf.mag_me
""")

# ---------------------------------------------------------------------------
# Breeding cooldown display
# ---------------------------------------------------------------------------
FOOD_TAGS = ["armadillo_food", "axolotl_food", "bee_food", "camel_food", "cat_food", "chicken_food", "cow_food", "fox_food",
             "frog_food", "goat_food", "hoglin_food", "horse_food", "llama_food", "ocelot_food", "panda_food", "pig_food",
             "rabbit_food", "sheep_food", "sniffer_food", "strider_food", "turtle_food", "wolf_food"]
js(f"data/{NS}/tags/item/animal_food.json", {"values": ["#minecraft:" + t for t in FOOD_TAGS]})
js(f"data/{NS}/tags/entity_type/breedable.json", {"values": ["minecraft:" + e for e in [
    "armadillo", "axolotl", "bee", "camel", "cat", "chicken", "cow", "mooshroom", "fox", "frog", "goat", "hoglin", "horse",
    "donkey", "llama", "ocelot", "panda", "pig", "rabbit", "sheep", "sniffer", "strider", "turtle", "wolf"]]})
fn("breed/check", """
    tag @s add tmf.hs_player
    scoreboard players set #found tmf.tmp 0
    execute as @e[type=#tmf:breedable,distance=..6] run function tmf:breed/candidate
    tag @s remove tmf.hs_player
""")
fn("breed/candidate", """
    execute if score #found tmf.tmp matches 1 run return 0
    tag @s add tmf.hs_cand
    execute if entity @a[tag=tmf.hs_player,limit=1,predicate=tmf:looking_at_candidate] run function tmf:breed/show
    tag @s remove tmf.hs_cand
""")
fn("breed/show", """
    scoreboard players set #found tmf.tmp 1
    execute store result score #age tmf.tmp run data get entity @s Age
    execute store result score #love tmf.tmp run data get entity @s InLove
    scoreboard players operation #t tmf.tmp = #age tmf.tmp
    execute if score #t tmf.tmp matches ..-1 run scoreboard players operation #t tmf.tmp *= #m1 tmf.c
    scoreboard players operation #t tmf.tmp /= #20 tmf.c
    scoreboard players operation #mm tmf.tmp = #t tmf.tmp
    scoreboard players operation #mm tmf.tmp /= #60 tmf.c
    scoreboard players operation #ss tmf.tmp = #t tmf.tmp
    scoreboard players operation #ss tmf.tmp %= #60 tmf.c
    data modify storage tmf:tmp br set value {z:""}
    execute if score #ss tmf.tmp matches ..9 run data modify storage tmf:tmp br.z set value "0"
    execute store result storage tmf:tmp br.m int 1 run scoreboard players get #mm tmf.tmp
    execute store result storage tmf:tmp br.s int 1 run scoreboard players get #ss tmf.tmp
    scoreboard players set @a[tag=tmf.hs_player] tmf.abt 10
    execute if score #love tmf.tmp matches 1.. run return run title @a[tag=tmf.hs_player] actionbar [{text:"❤ ",color:"red"},{text:"In love – looking for a partner",color:"light_purple"}]
    execute if score #age tmf.tmp matches 0 run return run title @a[tag=tmf.hs_player] actionbar [{text:"❤ ",color:"red"},{text:"Ready to breed",color:"green"}]
    execute if score #age tmf.tmp matches 1.. run return run function tmf:breed/cooldown with storage tmf:tmp br
    function tmf:breed/baby with storage tmf:tmp br
""")
fn("breed/cooldown", """
    $title @a[tag=tmf.hs_player] actionbar [{text:"⏳ ",color:"gold"},{text:"Can breed again in ",color:"gray"},{text:"$(m):$(z)$(s)",color:"yellow"}]
""")
fn("breed/baby", """
    $title @a[tag=tmf.hs_player] actionbar [{text:"🍼 ",color:"aqua"},{text:"Baby – grows up in ",color:"gray"},{text:"$(m):$(z)$(s)",color:"yellow"},{text:" (feeding speeds it up)",color:"dark_gray"}]
""")

# ---------------------------------------------------------------------------
# Sapling replant
# ---------------------------------------------------------------------------
js(f"data/{NS}/tags/block/sapling_space.json", {"values": ["minecraft:air", "minecraft:cave_air", "minecraft:short_grass",
    "minecraft:short_dry_grass", "minecraft:leaf_litter"]})
fn("sapling/check", """
    execute store result score #age tmf.tmp run data get entity @s Age
    execute if score #age tmf.tmp matches ..599 run return 0
    execute unless block ~ ~ ~ #tmf:sapling_space run return 0
    execute unless block ~ ~-1 ~ #minecraft:supports_vegetation run return 0
    data modify storage tmf:tmp sp set value {}
    data modify storage tmf:tmp sp.id set from entity @s Item.id
    function tmf:sapling/plant with storage tmf:tmp sp
    execute store result score #c tmf.tmp run data get entity @s Item.count
    execute if score #c tmf.tmp matches ..1 run return run kill @s
    scoreboard players remove #c tmf.tmp 1
    execute store result entity @s Item.count int 1 run scoreboard players get #c tmf.tmp
    data modify entity @s Age set value 0s
""")
fn("sapling/plant", """
    $setblock ~ ~ ~ $(id)
    playsound minecraft:block.grass.place block @a ~ ~ ~ 0.6 1
""")

# ---------------------------------------------------------------------------
# Copper oxidation indicator
# ---------------------------------------------------------------------------
_copper = ["chiseled_copper", "copper_bars", "copper_block", "copper_bulb", "copper_chain", "copper_chest", "copper_door", "copper_golem_statue", "copper_grate", "copper_lantern", "copper_trapdoor", "cut_copper", "cut_copper_slab", "cut_copper_stairs", "exposed_chiseled_copper", "exposed_copper", "exposed_copper_bars", "exposed_copper_bulb", "exposed_copper_chain", "exposed_copper_chest", "exposed_copper_door", "exposed_copper_golem_statue", "exposed_copper_grate", "exposed_copper_lantern", "exposed_copper_trapdoor", "exposed_cut_copper", "exposed_cut_copper_slab", "exposed_cut_copper_stairs", "oxidized_chiseled_copper", "oxidized_copper", "oxidized_copper_bars", "oxidized_copper_bulb", "oxidized_copper_chain", "oxidized_copper_chest", "oxidized_copper_door", "oxidized_copper_golem_statue", "oxidized_copper_grate", "oxidized_copper_lantern", "oxidized_copper_trapdoor", "oxidized_cut_copper", "oxidized_cut_copper_slab", "oxidized_cut_copper_stairs", "waxed_chiseled_copper", "waxed_copper_bars", "waxed_copper_block", "waxed_copper_bulb", "waxed_copper_chain", "waxed_copper_chest", "waxed_copper_door", "waxed_copper_golem_statue", "waxed_copper_grate", "waxed_copper_lantern", "waxed_copper_trapdoor", "waxed_cut_copper", "waxed_cut_copper_slab", "waxed_cut_copper_stairs", "waxed_exposed_chiseled_copper", "waxed_exposed_copper", "waxed_exposed_copper_bars", "waxed_exposed_copper_bulb", "waxed_exposed_copper_chain", "waxed_exposed_copper_chest", "waxed_exposed_copper_door", "waxed_exposed_copper_golem_statue", "waxed_exposed_copper_grate", "waxed_exposed_copper_lantern", "waxed_exposed_copper_trapdoor", "waxed_exposed_cut_copper", "waxed_exposed_cut_copper_slab", "waxed_exposed_cut_copper_stairs", "waxed_oxidized_chiseled_copper", "waxed_oxidized_copper", "waxed_oxidized_copper_bars", "waxed_oxidized_copper_bulb", "waxed_oxidized_copper_chain", "waxed_oxidized_copper_chest", "waxed_oxidized_copper_door", "waxed_oxidized_copper_golem_statue", "waxed_oxidized_copper_grate", "waxed_oxidized_copper_lantern", "waxed_oxidized_copper_trapdoor", "waxed_oxidized_cut_copper", "waxed_oxidized_cut_copper_slab", "waxed_oxidized_cut_copper_stairs", "waxed_weathered_chiseled_copper", "waxed_weathered_copper", "waxed_weathered_copper_bars", "waxed_weathered_copper_bulb", "waxed_weathered_copper_chain", "waxed_weathered_copper_chest", "waxed_weathered_copper_door", "waxed_weathered_copper_golem_statue", "waxed_weathered_copper_grate", "waxed_weathered_copper_lantern", "waxed_weathered_copper_trapdoor", "waxed_weathered_cut_copper", "waxed_weathered_cut_copper_slab", "waxed_weathered_cut_copper_stairs", "weathered_chiseled_copper", "weathered_copper", "weathered_copper_bars", "weathered_copper_bulb", "weathered_copper_chain", "weathered_copper_chest", "weathered_copper_door", "weathered_copper_golem_statue", "weathered_copper_grate", "weathered_copper_lantern", "weathered_copper_trapdoor", "weathered_cut_copper", "weathered_cut_copper_slab", "weathered_cut_copper_stairs"]
def _cp(pred): return ["minecraft:" + b for b in _copper if pred(b)]
js(f"data/{NS}/tags/block/copper/any.json", {"values": _cp(lambda b: True)})
js(f"data/{NS}/tags/block/copper/exposed.json", {"values": _cp(lambda b: "exposed" in b)})
js(f"data/{NS}/tags/block/copper/weathered.json", {"values": _cp(lambda b: "weathered" in b)})
js(f"data/{NS}/tags/block/copper/oxidized.json", {"values": _cp(lambda b: "oxidized" in b)})
js(f"data/{NS}/tags/block/copper/waxed.json", {"values": _cp(lambda b: b.startswith("waxed"))})
fn("copper/ray_start", """
    scoreboard players set #r tmf.tmp 0
    function tmf:copper/ray
""")
fn("copper/ray", """
    execute unless block ~ ~ ~ #tmf:ray_pass run return run function tmf:copper/hit
    scoreboard players add #r tmf.tmp 1
    execute if score #r tmf.tmp matches ..50 positioned ^ ^ ^0.1 run function tmf:copper/ray
""")
fn("copper/hit", """
    execute unless block ~ ~ ~ #tmf:copper/any run return fail
    data modify storage tmf:tmp cu set value {s:"Unaffected",c:"gold",w:"not waxed",wc:"gray"}
    execute if block ~ ~ ~ #tmf:copper/exposed run data modify storage tmf:tmp cu merge value {s:"Exposed",c:"#c58f6a"}
    execute if block ~ ~ ~ #tmf:copper/weathered run data modify storage tmf:tmp cu merge value {s:"Weathered",c:"#6a9f84"}
    execute if block ~ ~ ~ #tmf:copper/oxidized run data modify storage tmf:tmp cu merge value {s:"Oxidized",c:"#4fbf9f"}
    execute if block ~ ~ ~ #tmf:copper/waxed run data modify storage tmf:tmp cu merge value {w:"waxed",wc:"yellow"}
    scoreboard players set @s tmf.abt 10
    function tmf:copper/show with storage tmf:tmp cu
""")
fn("copper/show", """
    $title @s actionbar [{text:"Copper: ",color:"gray"},{text:"$(s)",color:"$(c)"},{text:" · ",color:"dark_gray"},{text:"$(w)",color:"$(wc)"}]
""")

# ---------------------------------------------------------------------------
# Playtime milestones
# ---------------------------------------------------------------------------
MILESTONES = [1, 5, 10, 25, 50, 100, 250, 500, 1000]
fn("milestone/check", "\n".join(
    ["scoreboard players operation #h tmf.tmp = @s tmf.s.play", "scoreboard players operation #h tmf.tmp /= #72000 tmf.c",
     "execute unless score @s tmf.ms matches 0.. run scoreboard players set @s tmf.ms 0"] +
    [f"execute if score #h tmf.tmp matches {m}.. unless score @s tmf.ms matches {m}.. run return run function tmf:milestone/reach {{h:{m}}}" for m in reversed(MILESTONES)]))
fn("milestone/reach", """
    $scoreboard players set @s tmf.ms $(h)
    $tellraw @a [{text:"🎉 ",color:"gold"},{selector:"@s",color:"yellow"},{text:" has played for ",color:"gray"},{text:"$(h) hour(s)",color:"gold"},{text:" on this server!",color:"gray"}]
    execute at @s run playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.5 1.2
""")

# ---------------------------------------------------------------------------
# Day counter
# ---------------------------------------------------------------------------
fn("day/check", """
    execute store result score #day tmf.tmp run time query minecraft:day repetition
    scoreboard players add #day tmf.tmp 1
    execute if score #day tmf.tmp = #lastday tmf.cfg run return 0
    execute unless score #lastday tmf.cfg matches 1.. run return run scoreboard players operation #lastday tmf.cfg = #day tmf.tmp
    scoreboard players operation #lastday tmf.cfg = #day tmf.tmp
    execute as @a[tag=!tmf.off.day_counter] run function tmf:day/announce
""")
fn("day/announce", """
    scoreboard players set @s tmf.abt 60
    title @s actionbar [{text:"☀ ",color:"yellow"},{text:"Day ",color:"gold"},{score:{name:"#lastday",objective:"tmf.cfg"},color:"gold",bold:true}]
    playsound minecraft:block.note_block.chime player @s ~ ~ ~ 0.4 1.4
""")
# ---------------------------------------------------------------------------
# Uninstall
# ---------------------------------------------------------------------------
fn("uninstall", f"""
    # restore game rules
    execute if score #no_phantoms tmf.cfg matches 1 if score #phantoms_orig tmf.cfg matches 1 run gamerule spawn_phantoms true
    scoreboard players set #afk tmf.cfg 0
    function tmf:afk/restore_sleep
    # clean up entities and players
    execute as @a[tag=tmf.onpath] run function tmf:paths/remove
    function tmf:enderman/strip_all
    function tmf:combat/clear_all
    function tmf:silence/off_all
    function tmf:afk/clear_all
    execute as @e[tag=tmf.pg] run function tmf:pets/unequip
    kill @e[type=minecraft:interaction,tag=tmf.ov]
    kill @e[type=minecraft:marker,tag=tmf.ld]
    kill @e[type=minecraft:marker,tag=tmf.plog]
    kill @e[type=minecraft:marker,tag=tmf.fs]
    execute as @a[tag=tmf.ntsf] run function tmf:trample/landed
    execute as @a[tag=tmf.fj] run function tmf:fence/remove
    tag @e[type=minecraft:armor_stand,tag=tmf.edit] remove tmf.edit
    kill @e[type=minecraft:item_display,tag=tmf.swap]
    kill @e[type=minecraft:item_display,tag=tmf.namebuf]
    tag @e[tag=tmf.dg] remove tmf.dg
    tag @e[tag=tmf.eg] remove tmf.eg
    {chr(10).join(f'tag @a remove tmf.off.{k}' for k, *_ in PERSONAL)}
    {chr(10).join(f'tag @a remove tmf.on.{k}' for k, *_ in PERSONAL)}
    tag @a remove tmf.known
    tag @a remove tmf.sneaking
    tag @a[tag=tmf.admin] remove tmf.admin
    team remove tmf.afk
    schedule clear tmf:loop/t5
    schedule clear tmf:loop/t20
    {chr(10).join(f'scoreboard objectives remove {o}' for o in DUMMIES + ["tmf", "tmf.stats", "tmf.deaths", "tmf.leave"] + list(STAT_OBJ))}
    data remove storage tmf:data online
    data remove storage tmf:data bars
    data remove storage tmf:data version
    data remove storage tmf:tmp d
    tellraw @a [{{text:"[TMF] ",color:"gold"}},{{text:"Uninstalled. Now remove the TMF folder from the world's datapacks folder (or disable it with /datapack disable) and run /reload.",color:"gray"}}]
""")

print("generated", OUT)
