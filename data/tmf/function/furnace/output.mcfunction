data modify storage tmf:tmp it set value {}
data modify storage tmf:tmp it.id set from block ~ ~ ~ Items[{Slot:2b}].id
execute store result storage tmf:tmp it.c int 1 run data get block ~ ~ ~ Items[{Slot:2b}].count
function tmf:util/item_name
function tmf:furnace/output_m with storage tmf:tmp it
