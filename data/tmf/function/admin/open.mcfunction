playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.2
data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"TMF Admin Panel",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"Pick a category to switch its features on or off for the whole server. Players can still turn personal features off for themselves unless you lock them.",color:"gray"},width:340}],columns:2,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 1"}}}}
scoreboard players set #cnt tmf.tmp 0
execute if score #best_tool tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tool_swap tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #veinminer tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tree_feller tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #leaf_decay tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #armor_warning tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_mining int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #harvest tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #no_trample tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #sapling_replant tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #ladder_drop tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #double_doors tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #invisible_frames tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #spawn_checker tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #cauldron_trash tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_farming int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #sort_chest tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #magnet tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pickup_notices tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #shulker_preview tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_inventory int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #pet_protect tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pet_teleport tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #pet_health tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #animal_owners tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #horse_stats tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #breed_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #silence_mobs tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #trader_alert tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #no_phantoms tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_mobs int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #creeper_nogrief tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #ghast_nogrief tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #zombie_doors tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #enderman_guard tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_griefing int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #health_bars tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #damage_numbers tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #death_glow tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #arrow_counter tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #campfire_regen tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_combat int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #coords_hud tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #waypoints tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #biome_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #day_counter tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #crop_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #campfire_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #furnace_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #copper_info tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #slime_chunks tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #lodestone_coords tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_info int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #fast_paths tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #fence_jump tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #spawn_tp tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_movement int 1 run scoreboard players get #cnt tmf.tmp
scoreboard players set #cnt tmf.tmp 0
execute if score #afk tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #stats_card tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #join_leave tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #milestones tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #entity_warning tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute if score #tpa tmf.cfg matches 1.. run scoreboard players add #cnt tmf.tmp 1
execute store result storage tmf:tmp a.c_multiplayer int 1 run scoreboard players get #cnt tmf.tmp
function tmf:admin/open_categories with storage tmf:tmp a
execute if score #perf tmf.cfg matches 1 run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"",extra:[{text:"⚡ Performance mode: ",color:"white"},{text:"ON",color:"yellow"}]},tooltip:{text:"Pauses health bars and damage numbers and slows down the enderman and cauldron scans."},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1210"}}
execute if score #perf tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"",extra:[{text:"⚡ Performance mode: ",color:"white"},{text:"OFF",color:"gray"}]},tooltip:{text:"Pauses health bars and damage numbers and slows down the enderman and cauldron scans."},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1210"}}
execute store result storage tmf:tmp a.afk int 1 run scoreboard players get #afk_min tmf.cfg
execute store result storage tmf:tmp a.sleep int 1 run scoreboard players get #sleep_pct tmf.cfg
execute store result storage tmf:tmp a.ew int 1 run scoreboard players get #ew_limit tmf.cfg
execute store result storage tmf:tmp a.tpc int 1 run scoreboard players get #tp_cd tmf.cfg
data modify storage tmf:tmp a.sp set value "World spawn"
execute if data storage tmf:data spawn.dim run function tmf:admin/spawn_label with storage tmf:data spawn
function tmf:admin/open_settings with storage tmf:tmp a
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🔍 Player inspector…",color:"aqua"},tooltip:{text:"Look up playtime, position and status of any player"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 6000"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🧹 Lag helper…",color:"aqua"},tooltip:{text:"Count loaded entities and clear dropped items, XP orbs, arrows or hostile mobs"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 5000"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🟢 Slime chunk seed…",color:"aqua"},tooltip:{text:"Enter the world seed once so the Slime Chunk Checker works"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 5100"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🎛 Presets…",color:"aqua"},tooltip:{text:"Apply a ready-made set of features"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1200"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🔒 Player locks…",color:"aqua"},tooltip:{text:"Force personal features on for everyone"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1220"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"📜 Changelog",color:"aqua"},tooltip:{text:"What is in this version"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1230"}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"🗑 Uninstall TMF…",color:"red"},tooltip:{text:"Remove all TMF data from the world"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 1240"}}
function tmf:util/show_dialog with storage tmf:tmp d
