playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.2
data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"🔍 Player inspector",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"Pick a player to see their details. ● online, ○ offline.",color:"gray"},width:340}],columns:3,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 2"}}}}
data modify storage tmf:tmp il set from storage tmf:data names
function tmf:insp/list_next
function tmf:util/show_dialog with storage tmf:tmp d
