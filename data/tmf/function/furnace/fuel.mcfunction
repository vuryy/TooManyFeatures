scoreboard players operation #sec tmf.tmp = #lit tmf.tmp
scoreboard players add #sec tmf.tmp 19
scoreboard players operation #sec tmf.tmp /= #20 tmf.c
function tmf:util/fmt_time
data modify storage tmf:tmp it set value {c:0}
data modify storage tmf:tmp it.t set from storage tmf:tmp tf.t
execute store result storage tmf:tmp it.c int 1 run data get block ~ ~ ~ Items[{Slot:1b}].count
execute if score #lit tmf.tmp matches 1.. run function tmf:furnace/fuel_m with storage tmf:tmp it
execute unless score #lit tmf.tmp matches 1.. run function tmf:furnace/fuel_spare_m with storage tmf:tmp it
