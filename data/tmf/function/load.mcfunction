# TMF v1.12.0 – load
scoreboard objectives add tmf.cfg dummy
scoreboard objectives add tmf.tmp dummy
scoreboard objectives add tmf.c dummy
scoreboard objectives add tmf.id dummy
scoreboard objectives add tmf.oid dummy
scoreboard objectives add tmf.cd dummy
scoreboard objectives add tmf.hp dummy
scoreboard objectives add tmf.lhp dummy
scoreboard objectives add tmf.hbt dummy
scoreboard objectives add tmf.dnt dummy
scoreboard objectives add tmf.hitt dummy
scoreboard objectives add tmf.afk dummy
scoreboard objectives add tmf.px dummy
scoreboard objectives add tmf.py dummy
scoreboard objectives add tmf.pz dummy
scoreboard objectives add tmf.rx dummy
scoreboard objectives add tmf.ry dummy
scoreboard objectives add tmf.dim dummy
scoreboard objectives add tmf.sess dummy
scoreboard objectives add tmf.abt dummy
scoreboard objectives add tmf.swapcd dummy
scoreboard objectives add tmf.share dummy
scoreboard objectives add tmf.mine dummy
scoreboard objectives add tmf.fight dummy
scoreboard objectives add tmf.ldt dummy
scoreboard objectives add tmf.pcd dummy
scoreboard objectives add tmf.awh dummy
scoreboard objectives add tmf.awc dummy
scoreboard objectives add tmf.awl dummy
scoreboard objectives add tmf.awf dummy
scoreboard objectives add tmf.awe dummy
scoreboard objectives add tmf.btsup dummy
scoreboard objectives add tmf.ms dummy
scoreboard objectives add tmf.cr dummy
scoreboard objectives add tmf.sl dummy
scoreboard objectives add tmf.wx dummy
scoreboard objectives add tmf.wy dummy
scoreboard objectives add tmf.wz dummy
scoreboard objectives add tmf.wd dummy
scoreboard objectives add tmf.wn dummy
scoreboard objectives add tmf.ws dummy
scoreboard objectives add tmf.bio dummy
scoreboard objectives add tmf.bic dummy
scoreboard objectives add tmf.slx dummy
scoreboard objectives add tmf.slz dummy
scoreboard objectives add tmf.slr dummy
scoreboard objectives add tmf.tpt dummy
scoreboard objectives add tmf.tpm dummy
scoreboard objectives add tmf.tpx dummy
scoreboard objectives add tmf.tpc dummy
scoreboard objectives add tmf trigger {text:"TMF menu"}
scoreboard objectives add tmf.stats trigger {text:"TMF stats"}
scoreboard objectives add tmf.deaths deathCount
scoreboard objectives add tmf.leave minecraft.custom:minecraft.leave_game
scoreboard objectives add tmf.s.play minecraft.custom:minecraft.play_time
scoreboard objectives add tmf.s.deaths minecraft.custom:minecraft.deaths
scoreboard objectives add tmf.s.mobs minecraft.custom:minecraft.mob_kills
scoreboard objectives add tmf.s.pk minecraft.custom:minecraft.player_kills
scoreboard objectives add tmf.s.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add tmf.s.sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add tmf.s.crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add tmf.s.swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add tmf.s.wow minecraft.custom:minecraft.walk_on_water_one_cm
scoreboard objectives add tmf.s.wuw minecraft.custom:minecraft.walk_under_water_one_cm
scoreboard objectives add tmf.s.climb minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add tmf.s.fly minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add tmf.s.boat minecraft.custom:minecraft.boat_one_cm
scoreboard objectives add tmf.s.horse minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add tmf.s.cart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add tmf.s.pig minecraft.custom:minecraft.pig_one_cm
scoreboard objectives add tmf.s.strider minecraft.custom:minecraft.strider_one_cm
scoreboard objectives add tmf.s.ghast minecraft.custom:minecraft.happy_ghast_one_cm
scoreboard objectives add tmf.s.naut minecraft.custom:minecraft.nautilus_one_cm
scoreboard objectives add tmf.s.jump minecraft.custom:minecraft.jump
scoreboard objectives add tmf.s.dmgd minecraft.custom:minecraft.damage_dealt
scoreboard objectives add tmf.s.dmgt minecraft.custom:minecraft.damage_taken
scoreboard objectives add tmf.s.since minecraft.custom:minecraft.time_since_death
scoreboard objectives add tmf.s.fish minecraft.custom:minecraft.fish_caught
scoreboard objectives add tmf.s.bred minecraft.custom:minecraft.animals_bred
scoreboard objectives add tmf.s.trade minecraft.custom:minecraft.traded_with_villager
scoreboard objectives add tmf.s.ench minecraft.custom:minecraft.enchant_item
scoreboard objectives add tmf.s.sleep minecraft.custom:minecraft.sleep_in_bed
scoreboard objectives add tmf.lg.0 minecraft.mined:minecraft.dark_oak_log
scoreboard objectives add tmf.lg.1 minecraft.mined:minecraft.dark_oak_wood
scoreboard objectives add tmf.lg.2 minecraft.mined:minecraft.stripped_dark_oak_log
scoreboard objectives add tmf.lg.3 minecraft.mined:minecraft.stripped_dark_oak_wood
scoreboard objectives add tmf.lg.4 minecraft.mined:minecraft.pale_oak_log
scoreboard objectives add tmf.lg.5 minecraft.mined:minecraft.pale_oak_wood
scoreboard objectives add tmf.lg.6 minecraft.mined:minecraft.stripped_pale_oak_log
scoreboard objectives add tmf.lg.7 minecraft.mined:minecraft.stripped_pale_oak_wood
scoreboard objectives add tmf.lg.8 minecraft.mined:minecraft.oak_log
scoreboard objectives add tmf.lg.9 minecraft.mined:minecraft.oak_wood
scoreboard objectives add tmf.lg.10 minecraft.mined:minecraft.stripped_oak_log
scoreboard objectives add tmf.lg.11 minecraft.mined:minecraft.stripped_oak_wood
scoreboard objectives add tmf.lg.12 minecraft.mined:minecraft.acacia_log
scoreboard objectives add tmf.lg.13 minecraft.mined:minecraft.acacia_wood
scoreboard objectives add tmf.lg.14 minecraft.mined:minecraft.stripped_acacia_log
scoreboard objectives add tmf.lg.15 minecraft.mined:minecraft.stripped_acacia_wood
scoreboard objectives add tmf.lg.16 minecraft.mined:minecraft.birch_log
scoreboard objectives add tmf.lg.17 minecraft.mined:minecraft.birch_wood
scoreboard objectives add tmf.lg.18 minecraft.mined:minecraft.stripped_birch_log
scoreboard objectives add tmf.lg.19 minecraft.mined:minecraft.stripped_birch_wood
scoreboard objectives add tmf.lg.20 minecraft.mined:minecraft.jungle_log
scoreboard objectives add tmf.lg.21 minecraft.mined:minecraft.jungle_wood
scoreboard objectives add tmf.lg.22 minecraft.mined:minecraft.stripped_jungle_log
scoreboard objectives add tmf.lg.23 minecraft.mined:minecraft.stripped_jungle_wood
scoreboard objectives add tmf.lg.24 minecraft.mined:minecraft.spruce_log
scoreboard objectives add tmf.lg.25 minecraft.mined:minecraft.spruce_wood
scoreboard objectives add tmf.lg.26 minecraft.mined:minecraft.stripped_spruce_log
scoreboard objectives add tmf.lg.27 minecraft.mined:minecraft.stripped_spruce_wood
scoreboard objectives add tmf.lg.28 minecraft.mined:minecraft.mangrove_log
scoreboard objectives add tmf.lg.29 minecraft.mined:minecraft.mangrove_wood
scoreboard objectives add tmf.lg.30 minecraft.mined:minecraft.stripped_mangrove_log
scoreboard objectives add tmf.lg.31 minecraft.mined:minecraft.stripped_mangrove_wood
scoreboard objectives add tmf.lg.32 minecraft.mined:minecraft.cherry_log
scoreboard objectives add tmf.lg.33 minecraft.mined:minecraft.cherry_wood
scoreboard objectives add tmf.lg.34 minecraft.mined:minecraft.stripped_cherry_log
scoreboard objectives add tmf.lg.35 minecraft.mined:minecraft.stripped_cherry_wood
scoreboard objectives add tmf.lg.36 minecraft.mined:minecraft.poplar_log
scoreboard objectives add tmf.lg.37 minecraft.mined:minecraft.poplar_wood
scoreboard objectives add tmf.lg.38 minecraft.mined:minecraft.stripped_poplar_log
scoreboard objectives add tmf.lg.39 minecraft.mined:minecraft.stripped_poplar_wood
scoreboard objectives add tmf.lg.40 minecraft.mined:minecraft.crimson_stem
scoreboard objectives add tmf.lg.41 minecraft.mined:minecraft.stripped_crimson_stem
scoreboard objectives add tmf.lg.42 minecraft.mined:minecraft.crimson_hyphae
scoreboard objectives add tmf.lg.43 minecraft.mined:minecraft.stripped_crimson_hyphae
scoreboard objectives add tmf.lg.44 minecraft.mined:minecraft.warped_stem
scoreboard objectives add tmf.lg.45 minecraft.mined:minecraft.stripped_warped_stem
scoreboard objectives add tmf.lg.46 minecraft.mined:minecraft.warped_hyphae
scoreboard objectives add tmf.lg.47 minecraft.mined:minecraft.stripped_warped_hyphae
scoreboard objectives add tmf.drop minecraft.custom:minecraft.drop
scoreboard objectives add tmf.or.0 minecraft.mined:minecraft.coal_ore
scoreboard objectives add tmf.or.1 minecraft.mined:minecraft.deepslate_coal_ore
scoreboard objectives add tmf.or.2 minecraft.mined:minecraft.iron_ore
scoreboard objectives add tmf.or.3 minecraft.mined:minecraft.deepslate_iron_ore
scoreboard objectives add tmf.or.4 minecraft.mined:minecraft.copper_ore
scoreboard objectives add tmf.or.5 minecraft.mined:minecraft.deepslate_copper_ore
scoreboard objectives add tmf.or.6 minecraft.mined:minecraft.gold_ore
scoreboard objectives add tmf.or.7 minecraft.mined:minecraft.deepslate_gold_ore
scoreboard objectives add tmf.or.8 minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add tmf.or.9 minecraft.mined:minecraft.redstone_ore
scoreboard objectives add tmf.or.10 minecraft.mined:minecraft.deepslate_redstone_ore
scoreboard objectives add tmf.or.11 minecraft.mined:minecraft.lapis_ore
scoreboard objectives add tmf.or.12 minecraft.mined:minecraft.deepslate_lapis_ore
scoreboard objectives add tmf.or.13 minecraft.mined:minecraft.diamond_ore
scoreboard objectives add tmf.or.14 minecraft.mined:minecraft.deepslate_diamond_ore
scoreboard objectives add tmf.or.15 minecraft.mined:minecraft.emerald_ore
scoreboard objectives add tmf.or.16 minecraft.mined:minecraft.deepslate_emerald_ore
scoreboard objectives add tmf.or.17 minecraft.mined:minecraft.nether_quartz_ore
scoreboard objectives add tmf.or.18 minecraft.mined:minecraft.ancient_debris

team add tmf.afk {text:"AFK"}
team modify tmf.afk color gray
team modify tmf.afk prefix {text:"[AFK] ",color:"dark_gray"}

# constants
scoreboard players set #2 tmf.c 2
scoreboard players set #m1 tmf.c -1
scoreboard players set #20 tmf.c 20
function tmf:sort/init_rank
scoreboard players set #5 tmf.c 5
scoreboard players set #10 tmf.c 10
scoreboard players set #16 tmf.c 16
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

data modify storage tmf:data bars set value [{f: "", e: "||||||||||||||||||||", c: "red"}, {f: "||", e: "||||||||||||||||||", c: "red"}, {f: "||||", e: "||||||||||||||||", c: "red"}, {f: "||||||", e: "||||||||||||||", c: "red"}, {f: "||||||||", e: "||||||||||||", c: "yellow"}, {f: "||||||||||", e: "||||||||||", c: "yellow"}, {f: "||||||||||||", e: "||||||||", c: "yellow"}, {f: "||||||||||||||", e: "||||||", c: "green"}, {f: "||||||||||||||||", e: "||||", c: "green"}, {f: "||||||||||||||||||", e: "||", c: "green"}, {f: "||||||||||||||||||||", e: "", c: "green"}]
data modify storage tmf:data version set value "1.12.0"
function tmf:slime/init
function tmf:util/init_block_items

execute unless score #installed tmf.cfg matches 1 run function tmf:config/install
# upgrades: features added in a newer version start switched on
execute unless score #tool_swap tmf.cfg matches -2147483648.. run scoreboard players set #tool_swap tmf.cfg 0
execute unless score #shulker_preview tmf.cfg matches -2147483648.. run scoreboard players set #shulker_preview tmf.cfg 1
execute unless score #death_glow tmf.cfg matches -2147483648.. run scoreboard players set #death_glow tmf.cfg 1
execute unless score #fast_paths tmf.cfg matches -2147483648.. run scoreboard players set #fast_paths tmf.cfg 1
execute unless score #horse_stats tmf.cfg matches -2147483648.. run scoreboard players set #horse_stats tmf.cfg 1
execute unless score #pet_protect tmf.cfg matches -2147483648.. run scoreboard players set #pet_protect tmf.cfg 1
execute unless score #no_phantoms tmf.cfg matches -2147483648.. run scoreboard players set #no_phantoms tmf.cfg 0
execute unless score #enderman_guard tmf.cfg matches -2147483648.. run scoreboard players set #enderman_guard tmf.cfg 0
execute unless score #silence_mobs tmf.cfg matches -2147483648.. run scoreboard players set #silence_mobs tmf.cfg 1
execute unless score #pet_teleport tmf.cfg matches -2147483648.. run scoreboard players set #pet_teleport tmf.cfg 1
execute unless score #ladder_drop tmf.cfg matches -2147483648.. run scoreboard players set #ladder_drop tmf.cfg 1
execute unless score #double_doors tmf.cfg matches -2147483648.. run scoreboard players set #double_doors tmf.cfg 1
execute unless score #cauldron_trash tmf.cfg matches -2147483648.. run scoreboard players set #cauldron_trash tmf.cfg 0
execute unless score #health_bars tmf.cfg matches -2147483648.. run scoreboard players set #health_bars tmf.cfg 1
execute unless score #damage_numbers tmf.cfg matches -2147483648.. run scoreboard players set #damage_numbers tmf.cfg 1
execute unless score #afk tmf.cfg matches -2147483648.. run scoreboard players set #afk tmf.cfg 0
execute unless score #stats_card tmf.cfg matches -2147483648.. run scoreboard players set #stats_card tmf.cfg 1
execute unless score #join_leave tmf.cfg matches -2147483648.. run scoreboard players set #join_leave tmf.cfg 0
execute unless score #harvest tmf.cfg matches -2147483648.. run scoreboard players set #harvest tmf.cfg 0
execute unless score #invisible_frames tmf.cfg matches -2147483648.. run scoreboard players set #invisible_frames tmf.cfg 1
execute unless score #no_trample tmf.cfg matches -2147483648.. run scoreboard players set #no_trample tmf.cfg 0
execute unless score #leaf_decay tmf.cfg matches -2147483648.. run scoreboard players set #leaf_decay tmf.cfg 0
execute unless score #armor_warning tmf.cfg matches -2147483648.. run scoreboard players set #armor_warning tmf.cfg 1
execute unless score #best_tool tmf.cfg matches -2147483648.. run scoreboard players set #best_tool tmf.cfg 0
execute unless score #coords_hud tmf.cfg matches -2147483648.. run scoreboard players set #coords_hud tmf.cfg 0
execute unless score #spawn_checker tmf.cfg matches -2147483648.. run scoreboard players set #spawn_checker tmf.cfg 0
execute unless score #veinminer tmf.cfg matches -2147483648.. run scoreboard players set #veinminer tmf.cfg 0
execute unless score #tree_feller tmf.cfg matches -2147483648.. run scoreboard players set #tree_feller tmf.cfg 0
execute unless score #trader_alert tmf.cfg matches -2147483648.. run scoreboard players set #trader_alert tmf.cfg 1
execute unless score #sort_chest tmf.cfg matches -2147483648.. run scoreboard players set #sort_chest tmf.cfg 1
execute unless score #pickup_notices tmf.cfg matches -2147483648.. run scoreboard players set #pickup_notices tmf.cfg 1
execute unless score #magnet tmf.cfg matches -2147483648.. run scoreboard players set #magnet tmf.cfg 0
execute unless score #breed_info tmf.cfg matches -2147483648.. run scoreboard players set #breed_info tmf.cfg 1
execute unless score #sapling_replant tmf.cfg matches -2147483648.. run scoreboard players set #sapling_replant tmf.cfg 0
execute unless score #copper_info tmf.cfg matches -2147483648.. run scoreboard players set #copper_info tmf.cfg 1
execute unless score #milestones tmf.cfg matches -2147483648.. run scoreboard players set #milestones tmf.cfg 1
execute unless score #day_counter tmf.cfg matches -2147483648.. run scoreboard players set #day_counter tmf.cfg 1
execute unless score #fence_jump tmf.cfg matches -2147483648.. run scoreboard players set #fence_jump tmf.cfg 1
execute unless score #creeper_nogrief tmf.cfg matches -2147483648.. run scoreboard players set #creeper_nogrief tmf.cfg 0
execute unless score #ghast_nogrief tmf.cfg matches -2147483648.. run scoreboard players set #ghast_nogrief tmf.cfg 0
execute unless score #zombie_doors tmf.cfg matches -2147483648.. run scoreboard players set #zombie_doors tmf.cfg 0
execute unless score #pet_health tmf.cfg matches -2147483648.. run scoreboard players set #pet_health tmf.cfg 1
execute unless score #animal_owners tmf.cfg matches -2147483648.. run scoreboard players set #animal_owners tmf.cfg 1
execute unless score #crop_info tmf.cfg matches -2147483648.. run scoreboard players set #crop_info tmf.cfg 1
execute unless score #biome_info tmf.cfg matches -2147483648.. run scoreboard players set #biome_info tmf.cfg 1
execute unless score #campfire_info tmf.cfg matches -2147483648.. run scoreboard players set #campfire_info tmf.cfg 1
execute unless score #furnace_info tmf.cfg matches -2147483648.. run scoreboard players set #furnace_info tmf.cfg 1
execute unless score #slime_chunks tmf.cfg matches -2147483648.. run scoreboard players set #slime_chunks tmf.cfg 0
execute unless score #arrow_counter tmf.cfg matches -2147483648.. run scoreboard players set #arrow_counter tmf.cfg 1
execute unless score #lodestone_coords tmf.cfg matches -2147483648.. run scoreboard players set #lodestone_coords tmf.cfg 0
execute unless score #waypoints tmf.cfg matches -2147483648.. run scoreboard players set #waypoints tmf.cfg 0
execute unless score #entity_warning tmf.cfg matches -2147483648.. run scoreboard players set #entity_warning tmf.cfg 1
execute unless score #campfire_regen tmf.cfg matches -2147483648.. run scoreboard players set #campfire_regen tmf.cfg 1
execute unless score #tpa tmf.cfg matches -2147483648.. run scoreboard players set #tpa tmf.cfg 0
execute unless score #spawn_tp tmf.cfg matches -2147483648.. run scoreboard players set #spawn_tp tmf.cfg 0
# v1.4.0: switch to the new default feature set once
execute unless score #defaults_v tmf.cfg matches 2.. run function tmf:admin/preset/recommended_silent
scoreboard players set #defaults_v tmf.cfg 2
# v1.9.2: Item Magnet is now off by default
execute unless score #defaults_v3 tmf.cfg matches 1 run scoreboard players set #magnet tmf.cfg 0
scoreboard players set #defaults_v3 tmf.cfg 1
# v1.11.1: features that give an edge over vanilla start off (Slime Chunk Checker, Waypoints, Compass Coordinates)
execute unless score #defaults_v4 tmf.cfg matches 1 run function tmf:config/defaults_v4
scoreboard players set #defaults_v4 tmf.cfg 1
# v1.11.2: AFK Detection off by default; Faster Paths, Fence Jumping and Biome Change Info are now opt-in per player
execute unless score #defaults_v5 tmf.cfg matches 1 run function tmf:config/defaults_v5
scoreboard players set #defaults_v5 tmf.cfg 1
execute unless score #ew_limit tmf.cfg matches 1.. run scoreboard players set #ew_limit tmf.cfg 200
execute unless score #tp_cd tmf.cfg matches 0.. run scoreboard players set #tp_cd tmf.cfg 30
function tmf:config/apply

execute unless data storage tmf:data online run data modify storage tmf:data online set value []
execute as @a at @s run function tmf:join/ensure_online
execute unless data storage tmf:data names run data modify storage tmf:data names set value []
execute unless data storage tmf:data wp run data modify storage tmf:data wp set value []
execute as @a at @s run function tmf:names/ensure

schedule function tmf:loop/t5 5t replace
schedule function tmf:loop/t20 20t replace
tellraw @a {text:"TMF - loaded"}
