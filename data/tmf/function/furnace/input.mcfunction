data modify storage tmf:tmp it set value {pct:0,t:"?",all:""}
data modify storage tmf:tmp it.id set from block ~ ~ ~ Items[{Slot:0b}].id
execute store result score #cnt tmf.tmp run data get block ~ ~ ~ Items[{Slot:0b}].count
execute store result storage tmf:tmp it.c int 1 run scoreboard players get #cnt tmf.tmp
function tmf:util/item_name
execute if score #tt tmf.tmp matches 1.. run function tmf:furnace/progress
function tmf:furnace/input_m with storage tmf:tmp it
