$execute unless entity @a[scores={tmf.id=$(id)},tag=!tmf.off.tpa] run return 0
scoreboard players add #n tmf.tmp 1
$data modify storage tmf:tmp d.dialog.actions append value {label:{text:"$(name)",color:"white"},tooltip:{text:"Send $(name) a teleport request"},width:110,action:{type:"minecraft:run_command",command:"/trigger tmf set $(code)"}}
