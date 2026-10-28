data modify storage tmf:tmp cf set value {l:[],e:[]}
execute if data block ~ ~ ~ Items[{Slot:0b}] run function tmf:campfire/slot {i:0}
execute if data block ~ ~ ~ Items[{Slot:1b}] run function tmf:campfire/slot {i:1}
execute if data block ~ ~ ~ Items[{Slot:2b}] run function tmf:campfire/slot {i:2}
execute if data block ~ ~ ~ Items[{Slot:3b}] run function tmf:campfire/slot {i:3}
function tmf:campfire/group
execute unless data storage tmf:tmp cf.l[0] run data modify storage tmf:tmp cf.l append value {text:"nothing cooking",color:"gray"}
execute if block ~ ~ ~ #minecraft:campfires[lit=false] run data modify storage tmf:tmp cf.l append value {text:"not lit",color:"red"}
scoreboard players set @s tmf.abt 10
title @s actionbar [{text:"🔥 ",color:"gold"},{nbt:"cf.l[]",storage:"tmf:tmp",interpret:true,separator:{text:" · ",color:"dark_gray"}}]
