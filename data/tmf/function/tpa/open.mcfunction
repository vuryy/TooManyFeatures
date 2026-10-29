playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.3
data modify storage tmf:tmp d set value {dialog:{type:"minecraft:multi_action",title:{text:"🌀 Teleport requests",color:"gold",bold:true},body:[{type:"minecraft:plain_message",contents:{text:"Pick a player to send them a teleport request. They have 60 seconds to accept it.",color:"gray"},width:340}],columns:3,pause:false,actions:[],exit_action:{label:{text:"Back"},width:150,action:{type:"minecraft:run_command",command:"/trigger tmf set 1"}}}}
execute if score @s tmf.tpx matches 1.. run data modify storage tmf:tmp d.dialog.actions append value {label:{text:"✖ Cancel my request",color:"red"},tooltip:{text:"Withdraw the request you sent"},width:110,action:{type:"minecraft:run_command",command:"/trigger tmf set 7001"}}
scoreboard players operation #cm tmf.tmp = @s tmf.id
scoreboard players add #cm tmf.tmp 200000
scoreboard players set #n tmf.tmp 0
data modify storage tmf:tmp tl set from storage tmf:data online
function tmf:tpa/list_next
execute if score #n tmf.tmp matches 0 run data modify storage tmf:tmp d.dialog.body[0].contents.text set value "Nobody else who accepts teleport requests is online right now."
function tmf:util/show_dialog with storage tmf:tmp d
