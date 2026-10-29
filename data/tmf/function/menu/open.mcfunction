playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.4
data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"TMF Settings",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"Pick a category to switch your personal features on or off. Features switched off by the server are not listed.",color:"gray"},width:340}],columns:2,pause:false,actions:[],exit_action:{label:{text:"Close"},width:150}}}
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #best_tool tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #best_tool tmf.cfg matches 1.. if entity @s[tag=tmf.on.best_tool] run scoreboard players add #con tmf.tmp 1
execute if score #tool_swap tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tool_swap tmf.cfg matches 1.. if entity @s[tag=tmf.on.tool_swap] run scoreboard players add #con tmf.tmp 1
execute if score #veinminer tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #veinminer tmf.cfg matches 1.. if entity @s[tag=!tmf.off.veinminer] run scoreboard players add #con tmf.tmp 1
execute if score #tree_feller tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tree_feller tmf.cfg matches 1.. if entity @s[tag=!tmf.off.tree_feller] run scoreboard players add #con tmf.tmp 1
execute if score #armor_warning tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #armor_warning tmf.cfg matches 1.. if entity @s[tag=!tmf.off.armor_warning] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_mining int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_mining int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #harvest tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #harvest tmf.cfg matches 1.. if entity @s[tag=!tmf.off.harvest] run scoreboard players add #con tmf.tmp 1
execute if score #ladder_drop tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #ladder_drop tmf.cfg matches 1.. if entity @s[tag=!tmf.off.ladder_drop] run scoreboard players add #con tmf.tmp 1
execute if score #double_doors tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #double_doors tmf.cfg matches 1.. if entity @s[tag=!tmf.off.double_doors] run scoreboard players add #con tmf.tmp 1
execute if score #invisible_frames tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #invisible_frames tmf.cfg matches 1.. if entity @s[tag=!tmf.off.invisible_frames] run scoreboard players add #con tmf.tmp 1
execute if score #spawn_checker tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #spawn_checker tmf.cfg matches 1.. if entity @s[tag=!tmf.off.spawn_checker] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_farming int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_farming int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #sort_chest tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #sort_chest tmf.cfg matches 1.. if entity @s[tag=tmf.on.sort_chest] run scoreboard players add #con tmf.tmp 1
execute if score #magnet tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #magnet tmf.cfg matches 1.. if entity @s[tag=tmf.on.magnet] run scoreboard players add #con tmf.tmp 1
execute if score #pickup_notices tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pickup_notices tmf.cfg matches 1.. if entity @s[tag=!tmf.off.pickup_notices] run scoreboard players add #con tmf.tmp 1
execute if score #shulker_preview tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #shulker_preview tmf.cfg matches 1.. if entity @s[tag=!tmf.off.shulker_preview] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_inventory int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_inventory int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #pet_teleport tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pet_teleport tmf.cfg matches 1.. if entity @s[tag=!tmf.off.pet_teleport] run scoreboard players add #con tmf.tmp 1
execute if score #pet_health tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pet_health tmf.cfg matches 1.. if entity @s[tag=!tmf.off.pet_health] run scoreboard players add #con tmf.tmp 1
execute if score #animal_owners tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #animal_owners tmf.cfg matches 1.. if entity @s[tag=!tmf.off.animal_owners] run scoreboard players add #con tmf.tmp 1
execute if score #horse_stats tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #horse_stats tmf.cfg matches 1.. if entity @s[tag=!tmf.off.horse_stats] run scoreboard players add #con tmf.tmp 1
execute if score #breed_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #breed_info tmf.cfg matches 1.. if entity @s[tag=!tmf.off.breed_info] run scoreboard players add #con tmf.tmp 1
execute if score #trader_alert tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #trader_alert tmf.cfg matches 1.. if entity @s[tag=tmf.on.trader_alert] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_mobs int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_mobs int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #arrow_counter tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #arrow_counter tmf.cfg matches 1.. if entity @s[tag=!tmf.off.arrow_counter] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_combat int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_combat int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #coords_hud tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #coords_hud tmf.cfg matches 1.. if entity @s[tag=tmf.on.coords_hud] run scoreboard players add #con tmf.tmp 1
execute if score #waypoints tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #waypoints tmf.cfg matches 1.. if entity @s[tag=!tmf.off.waypoints] run scoreboard players add #con tmf.tmp 1
execute if score #biome_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #biome_info tmf.cfg matches 1.. if entity @s[tag=tmf.on.biome_info] run scoreboard players add #con tmf.tmp 1
execute if score #day_counter tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #day_counter tmf.cfg matches 1.. if entity @s[tag=!tmf.off.day_counter] run scoreboard players add #con tmf.tmp 1
execute if score #crop_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #crop_info tmf.cfg matches 1.. if entity @s[tag=!tmf.off.crop_info] run scoreboard players add #con tmf.tmp 1
execute if score #campfire_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #campfire_info tmf.cfg matches 1.. if entity @s[tag=!tmf.off.campfire_info] run scoreboard players add #con tmf.tmp 1
execute if score #furnace_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #furnace_info tmf.cfg matches 1.. if entity @s[tag=!tmf.off.furnace_info] run scoreboard players add #con tmf.tmp 1
execute if score #copper_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #copper_info tmf.cfg matches 1.. if entity @s[tag=!tmf.off.copper_info] run scoreboard players add #con tmf.tmp 1
execute if score #slime_chunks tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #slime_chunks tmf.cfg matches 1.. if entity @s[tag=!tmf.off.slime_chunks] run scoreboard players add #con tmf.tmp 1
execute if score #lodestone_coords tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #lodestone_coords tmf.cfg matches 1.. if entity @s[tag=!tmf.off.lodestone_coords] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_info int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_info int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #fast_paths tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #fast_paths tmf.cfg matches 1.. if entity @s[tag=tmf.on.fast_paths] run scoreboard players add #con tmf.tmp 1
execute if score #fence_jump tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #fence_jump tmf.cfg matches 1.. if entity @s[tag=tmf.on.fence_jump] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_movement int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_movement int 1 run scoreboard players get #con tmf.tmp
scoreboard players set #cnt tmf.tmp 0
scoreboard players set #con tmf.tmp 0
execute if score #tpa tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tpa tmf.cfg matches 1.. if entity @s[tag=!tmf.off.tpa] run scoreboard players add #con tmf.tmp 1
execute store result storage tmf:tmp pm.n_multiplayer int 1 run scoreboard players get #cnt tmf.tmp
execute store result storage tmf:tmp pm.o_multiplayer int 1 run scoreboard players get #con tmf.tmp
function tmf:menu/open_categories with storage tmf:tmp pm
execute if score #waypoints tmf.cfg matches 1 if entity @s[tag=!tmf.off.waypoints] run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"📍 Waypoints…",color:"aqua"},tooltip:{text:"Save places and get guided back to them"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 4000"}}
execute if score #tpa tmf.cfg matches 1 if entity @s[tag=!tmf.off.tpa] run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🌀 Teleport requests…",color:"aqua"},tooltip:{text:"Ask another player to teleport you to them, or them to you"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 7000"}}
execute if score #spawn_tp tmf.cfg matches 1 run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🏠 Teleport to spawn",color:"aqua"},tooltip:{text:"Teleport to the spawn point"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 7010"}}
execute if score #stats_card tmf.cfg matches 1 run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"📊 My stats",color:"aqua"},tooltip:{text:"Show your playtime and statistics"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf.stats"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🖥 Server features",color:"aqua"},tooltip:{text:"See which TMF features are enabled on this server"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 3"}}
execute if entity @s[tag=tmf.admin] run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"⚙ Admin panel",color:"gold"},tooltip:{text:"Server-wide settings"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}
function tmf:util/show_dialog with storage tmf:tmp d
