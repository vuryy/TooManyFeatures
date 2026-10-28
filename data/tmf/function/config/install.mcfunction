# First-time install: default settings
scoreboard players set #installed tmf.cfg 1
function tmf:legacy_cleanup
kill @e[type=minecraft:marker,tag=tmf.plog]
scoreboard players set #next tmf.id 0
execute as @a unless score @s tmf.id matches 1.. run function tmf:join/assign_id
tag @a add tmf.known
scoreboard players set #tool_swap tmf.cfg 0
scoreboard players set #shulker_preview tmf.cfg 1
scoreboard players set #death_glow tmf.cfg 1
scoreboard players set #fast_paths tmf.cfg 1
scoreboard players set #horse_stats tmf.cfg 1
scoreboard players set #pet_protect tmf.cfg 1
scoreboard players set #no_phantoms tmf.cfg 0
scoreboard players set #enderman_guard tmf.cfg 0
scoreboard players set #silence_mobs tmf.cfg 1
scoreboard players set #pet_teleport tmf.cfg 1
scoreboard players set #ladder_drop tmf.cfg 1
scoreboard players set #double_doors tmf.cfg 1
scoreboard players set #cauldron_trash tmf.cfg 0
scoreboard players set #health_bars tmf.cfg 1
scoreboard players set #damage_numbers tmf.cfg 1
scoreboard players set #afk tmf.cfg 0
scoreboard players set #stats_card tmf.cfg 1
scoreboard players set #join_leave tmf.cfg 0
scoreboard players set #harvest tmf.cfg 0
scoreboard players set #invisible_frames tmf.cfg 1
scoreboard players set #no_trample tmf.cfg 0
scoreboard players set #leaf_decay tmf.cfg 0
scoreboard players set #armor_warning tmf.cfg 1
scoreboard players set #best_tool tmf.cfg 0
scoreboard players set #coords_hud tmf.cfg 0
scoreboard players set #spawn_checker tmf.cfg 0
scoreboard players set #veinminer tmf.cfg 0
scoreboard players set #tree_feller tmf.cfg 0
scoreboard players set #trader_alert tmf.cfg 1
scoreboard players set #sort_chest tmf.cfg 1
scoreboard players set #pickup_notices tmf.cfg 1
scoreboard players set #magnet tmf.cfg 0
scoreboard players set #breed_info tmf.cfg 1
scoreboard players set #sapling_replant tmf.cfg 0
scoreboard players set #copper_info tmf.cfg 1
scoreboard players set #milestones tmf.cfg 1
scoreboard players set #day_counter tmf.cfg 1
scoreboard players set #fence_jump tmf.cfg 1
scoreboard players set #creeper_nogrief tmf.cfg 0
scoreboard players set #ghast_nogrief tmf.cfg 0
scoreboard players set #zombie_doors tmf.cfg 0
scoreboard players set #pet_health tmf.cfg 1
scoreboard players set #animal_owners tmf.cfg 1
scoreboard players set #crop_info tmf.cfg 1
scoreboard players set #biome_info tmf.cfg 1
scoreboard players set #campfire_info tmf.cfg 1
scoreboard players set #furnace_info tmf.cfg 1
scoreboard players set #slime_chunks tmf.cfg 0
scoreboard players set #arrow_counter tmf.cfg 1
scoreboard players set #lodestone_coords tmf.cfg 0
scoreboard players set #waypoints tmf.cfg 0
scoreboard players set #entity_warning tmf.cfg 1
scoreboard players set #campfire_regen tmf.cfg 1
function tmf:config/defaults_values
execute store result score #sleep_pct tmf.cfg run gamerule players_sleeping_percentage
execute store result score #phantoms_orig tmf.cfg run gamerule spawn_phantoms
