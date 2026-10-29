data modify storage tmf:tmp d set value {dialog:{type:"minecraft:notice",title:{text:"TMF – Server features",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"",extra:[]},width:340}],pause:false,action:{label:{text:"Back"},action:{type:"minecraft:run_command",command:"/trigger tmf set 1"}}}}
execute if score #tool_swap tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Tool Protector\n",color:"green"}
execute if score #tool_swap tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Tool Protector\n",color:"red"}
execute if score #shulker_preview tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Shulker Preview\n",color:"green"}
execute if score #shulker_preview tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Shulker Preview\n",color:"red"}
execute if score #death_glow tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Death-Drop Glow\n",color:"green"}
execute if score #death_glow tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Death-Drop Glow\n",color:"red"}
execute if score #fast_paths tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Faster Paths\n",color:"green"}
execute if score #fast_paths tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Faster Paths\n",color:"red"}
execute if score #horse_stats tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Horse Stats\n",color:"green"}
execute if score #horse_stats tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Horse Stats\n",color:"red"}
execute if score #pet_protect tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Pet Protection\n",color:"green"}
execute if score #pet_protect tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Pet Protection\n",color:"red"}
execute if score #no_phantoms tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ No Phantoms\n",color:"green"}
execute if score #no_phantoms tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ No Phantoms\n",color:"red"}
execute if score #enderman_guard tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Enderman Anti-Grief\n",color:"green"}
execute if score #enderman_guard tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Enderman Anti-Grief\n",color:"red"}
execute if score #silence_mobs tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Silence Mobs\n",color:"green"}
execute if score #silence_mobs tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Silence Mobs\n",color:"red"}
execute if score #pet_teleport tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Pet Teleport\n",color:"green"}
execute if score #pet_teleport tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Pet Teleport\n",color:"red"}
execute if score #ladder_drop tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Ladder Dropping\n",color:"green"}
execute if score #ladder_drop tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Ladder Dropping\n",color:"red"}
execute if score #double_doors tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Double Doors\n",color:"green"}
execute if score #double_doors tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Double Doors\n",color:"red"}
execute if score #cauldron_trash tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Cauldron Trash\n",color:"green"}
execute if score #cauldron_trash tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Cauldron Trash\n",color:"red"}
execute if score #health_bars tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Health Bars\n",color:"green"}
execute if score #health_bars tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Health Bars\n",color:"red"}
execute if score #damage_numbers tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Damage Numbers\n",color:"green"}
execute if score #damage_numbers tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Damage Numbers\n",color:"red"}
execute if score #afk tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ AFK Detection\n",color:"green"}
execute if score #afk tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ AFK Detection\n",color:"red"}
execute if score #stats_card tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Stats Card\n",color:"green"}
execute if score #stats_card tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Stats Card\n",color:"red"}
execute if score #join_leave tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Join & Leave Messages\n",color:"green"}
execute if score #join_leave tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Join & Leave Messages\n",color:"red"}
execute if score #harvest tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Right-Click Harvest\n",color:"green"}
execute if score #harvest tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Right-Click Harvest\n",color:"red"}
execute if score #invisible_frames tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Invisible Item Frames\n",color:"green"}
execute if score #invisible_frames tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Invisible Item Frames\n",color:"red"}
execute if score #no_trample tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ No Crop Trampling\n",color:"green"}
execute if score #no_trample tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ No Crop Trampling\n",color:"red"}
execute if score #leaf_decay tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Fast Leaf Decay\n",color:"green"}
execute if score #leaf_decay tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Fast Leaf Decay\n",color:"red"}
execute if score #armor_warning tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Armor Warning\n",color:"green"}
execute if score #armor_warning tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Armor Warning\n",color:"red"}
execute if score #best_tool tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Tool Auto-Swap\n",color:"green"}
execute if score #best_tool tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Tool Auto-Swap\n",color:"red"}
execute if score #coords_hud tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Coordinates HUD\n",color:"green"}
execute if score #coords_hud tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Coordinates HUD\n",color:"red"}
execute if score #spawn_checker tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Spawn-Proof Checker\n",color:"green"}
execute if score #spawn_checker tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Spawn-Proof Checker\n",color:"red"}
execute if score #veinminer tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Veinminer\n",color:"green"}
execute if score #veinminer tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Veinminer\n",color:"red"}
execute if score #tree_feller tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Tree Feller\n",color:"green"}
execute if score #tree_feller tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Tree Feller\n",color:"red"}
execute if score #trader_alert tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Wandering Trader Alert\n",color:"green"}
execute if score #trader_alert tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Wandering Trader Alert\n",color:"red"}
execute if score #sort_chest tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Sort Chest\n",color:"green"}
execute if score #sort_chest tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Sort Chest\n",color:"red"}
execute if score #pickup_notices tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Pickup Notices\n",color:"green"}
execute if score #pickup_notices tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Pickup Notices\n",color:"red"}
execute if score #magnet tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Item Magnet\n",color:"green"}
execute if score #magnet tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Item Magnet\n",color:"red"}
execute if score #breed_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Breeding Info\n",color:"green"}
execute if score #breed_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Breeding Info\n",color:"red"}
execute if score #sapling_replant tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Sapling Replant\n",color:"green"}
execute if score #sapling_replant tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Sapling Replant\n",color:"red"}
execute if score #copper_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Copper Oxidation Info\n",color:"green"}
execute if score #copper_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Copper Oxidation Info\n",color:"red"}
execute if score #milestones tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Playtime Milestones\n",color:"green"}
execute if score #milestones tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Playtime Milestones\n",color:"red"}
execute if score #day_counter tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Day Counter\n",color:"green"}
execute if score #day_counter tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Day Counter\n",color:"red"}
execute if score #fence_jump tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Fence Jumping\n",color:"green"}
execute if score #fence_jump tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Fence Jumping\n",color:"red"}
execute if score #creeper_nogrief tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Creeper No-Grief\n",color:"green"}
execute if score #creeper_nogrief tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Creeper No-Grief\n",color:"red"}
execute if score #ghast_nogrief tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Ghast No-Grief\n",color:"green"}
execute if score #ghast_nogrief tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Ghast No-Grief\n",color:"red"}
execute if score #zombie_doors tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ No Zombie Door Breaking\n",color:"green"}
execute if score #zombie_doors tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ No Zombie Door Breaking\n",color:"red"}
execute if score #pet_health tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Pet Health\n",color:"green"}
execute if score #pet_health tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Pet Health\n",color:"red"}
execute if score #animal_owners tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Animal Owners\n",color:"green"}
execute if score #animal_owners tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Animal Owners\n",color:"red"}
execute if score #crop_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Crop Growth Info\n",color:"green"}
execute if score #crop_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Crop Growth Info\n",color:"red"}
execute if score #biome_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Biome Change Info\n",color:"green"}
execute if score #biome_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Biome Change Info\n",color:"red"}
execute if score #campfire_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Campfire Timer\n",color:"green"}
execute if score #campfire_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Campfire Timer\n",color:"red"}
execute if score #furnace_info tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Furnace Progress\n",color:"green"}
execute if score #furnace_info tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Furnace Progress\n",color:"red"}
execute if score #slime_chunks tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Slime Chunk Checker\n",color:"green"}
execute if score #slime_chunks tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Slime Chunk Checker\n",color:"red"}
execute if score #arrow_counter tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Arrow Counter\n",color:"green"}
execute if score #arrow_counter tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Arrow Counter\n",color:"red"}
execute if score #lodestone_coords tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Compass Coordinates\n",color:"green"}
execute if score #lodestone_coords tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Compass Coordinates\n",color:"red"}
execute if score #waypoints tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Waypoints\n",color:"green"}
execute if score #waypoints tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Waypoints\n",color:"red"}
execute if score #entity_warning tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Entity Crowd Warning\n",color:"green"}
execute if score #entity_warning tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Entity Crowd Warning\n",color:"red"}
execute if score #campfire_regen tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Campfire Regen\n",color:"green"}
execute if score #campfire_regen tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Campfire Regen\n",color:"red"}
execute if score #tpa tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Teleport Requests\n",color:"green"}
execute if score #tpa tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Teleport Requests\n",color:"red"}
execute if score #spawn_tp tmf.cfg matches 1.. run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✔ Spawn Teleport\n",color:"green"}
execute if score #spawn_tp tmf.cfg matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"✘ Spawn Teleport\n",color:"red"}
execute if score #perf tmf.cfg matches 1 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"\n⚡ Performance mode is on: health bars and damage numbers are paused.",color:"yellow"}
function tmf:util/show_dialog with storage tmf:tmp d
