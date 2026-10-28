data modify storage tmf:tmp fu set value {l:[]}
scoreboard players set #sp tmf.tmp 0
scoreboard players set #tt tmf.tmp 0
scoreboard players set #lit tmf.tmp 0
execute store result score #sp tmf.tmp run data get block ~ ~ ~ cooking_time_spent
execute store result score #tt tmf.tmp run data get block ~ ~ ~ cooking_total_time
execute store result score #lit tmf.tmp run data get block ~ ~ ~ lit_time_remaining
execute if data block ~ ~ ~ Items[{Slot:0b}] run function tmf:furnace/input
execute unless data block ~ ~ ~ Items[{Slot:0b}] run data modify storage tmf:tmp fu.l append value {text:"idle",color:"gray"}
execute if score #lit tmf.tmp matches 1.. run function tmf:furnace/fuel
execute if score #lit tmf.tmp matches ..0 if data block ~ ~ ~ Items[{Slot:0b}] unless data block ~ ~ ~ Items[{Slot:1b}] run data modify storage tmf:tmp fu.l append value {text:"needs fuel",color:"red"}
execute if score #lit tmf.tmp matches ..0 if data block ~ ~ ~ Items[{Slot:1b}] unless data block ~ ~ ~ Items[{Slot:0b}] run function tmf:furnace/fuel
execute if data block ~ ~ ~ Items[{Slot:2b}] run function tmf:furnace/output
scoreboard players set @s tmf.abt 10
title @s actionbar [{text:"🔥 ",color:"gold"},{nbt:"fu.l[]",storage:"tmf:tmp",interpret:true,separator:{text:"  ·  ",color:"dark_gray"}}]
