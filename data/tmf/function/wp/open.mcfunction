execute unless score #waypoints tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.waypoints] run return run function tmf:menu/open
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.3
execute store result storage tmf:tmp w.id int 1 run scoreboard players get @s tmf.id
data modify storage tmf:tmp w.e set value {}
function tmf:wp/load with storage tmf:tmp w
data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"📍 Waypoints",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"",color:"gray",extra:[{text:"Pick a slot and a name, then save to remember the spot you are standing on. Guiding shows direction and distance in the bar at the top of the screen.\n\n"}]},width:340}],inputs:[{type:"minecraft:single_option",key:"slot",label:{text:"Slot"},width:100,options:[{id:"1",display:{text:"1"},initial:true},{id:"2",display:{text:"2"}},{id:"3",display:{text:"3"}}]},{type:"minecraft:single_option",key:"lbl",label:{text:"Name"},width:200,options:[{id:"01",display:{text:"Home"},initial:true},{id:"02",display:{text:"Base"}},{id:"03",display:{text:"Farm"}},{id:"04",display:{text:"Mine"}},{id:"05",display:{text:"Portal"}},{id:"06",display:{text:"Village"}},{id:"07",display:{text:"Spawn"}},{id:"08",display:{text:"Outpost"}},{id:"09",display:{text:"Shop"}},{id:"10",display:{text:"Treasure"}},{id:"11",display:{text:"Friend"}},{id:"12",display:{text:"Camp"}}]}],columns:2,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 1"}}}}
data modify storage tmf:tmp d.dialog.actions append value {label:{text:"💾 Save my position",color:"green"},tooltip:{text:"Saves where you stand into the chosen slot with the chosen name"},width:200,action:{type:"minecraft:dynamic/run_command",template:"/trigger tmf set 4$(slot)$(lbl)"}}
execute if score @s tmf.ws matches 1.. run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"⏹ Stop guiding",color:"yellow"},tooltip:{text:"Hide the waypoint from the top bar"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 4004"}}
execute if data storage tmf:tmp w.e.s1 run function tmf:wp/list_slot {slot:1}
execute unless data storage tmf:tmp w.e.s1 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"1. (empty)\n",color:"dark_gray"}
execute if data storage tmf:tmp w.e.s2 run function tmf:wp/list_slot {slot:2}
execute unless data storage tmf:tmp w.e.s2 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"2. (empty)\n",color:"dark_gray"}
execute if data storage tmf:tmp w.e.s3 run function tmf:wp/list_slot {slot:3}
execute unless data storage tmf:tmp w.e.s3 run data modify storage tmf:tmp d.dialog.body[0].contents.extra append value {text:"3. (empty)\n",color:"dark_gray"}
execute if data entity @s LastDeathLocation run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"💀 Guide to last death",color:"gray"},tooltip:{text:"Guide you back to where you last died"},width:200,action:{type:"minecraft:run_command",command:"/trigger tmf set 4005"}}
function tmf:util/show_dialog with storage tmf:tmp d
