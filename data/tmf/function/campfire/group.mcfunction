# takes the first item type, counts it and finds its shortest / longest time, then repeats with the rest
execute unless data storage tmf:tmp cf.e[0] run return 0
data modify storage tmf:tmp cg set value {}
data modify storage tmf:tmp cg.id set from storage tmf:tmp cf.e[0].id
data modify storage tmf:tmp cf.rest set value []
scoreboard players set #gc tmf.tmp 0
scoreboard players set #gmin tmf.tmp 2147483647
scoreboard players set #gmax tmf.tmp -1
function tmf:campfire/group_scan
data modify storage tmf:tmp cf.e set from storage tmf:tmp cf.rest
data modify storage tmf:tmp it set value {}
data modify storage tmf:tmp it.id set from storage tmf:tmp cg.id
function tmf:util/item_name
execute store result storage tmf:tmp it.c int 1 run scoreboard players get #gc tmf.tmp
scoreboard players operation #sec tmf.tmp = #gmin tmf.tmp
function tmf:util/fmt_time
data modify storage tmf:tmp it.a set from storage tmf:tmp tf.t
scoreboard players operation #sec tmf.tmp = #gmax tmf.tmp
function tmf:util/fmt_time
data modify storage tmf:tmp it.b set from storage tmf:tmp tf.t
execute if score #gc tmf.tmp matches 1 run function tmf:campfire/out_one with storage tmf:tmp it
execute if score #gc tmf.tmp matches 2.. if score #gmin tmf.tmp = #gmax tmf.tmp run function tmf:campfire/out_same with storage tmf:tmp it
execute if score #gc tmf.tmp matches 2.. unless score #gmin tmf.tmp = #gmax tmf.tmp run function tmf:campfire/out_range with storage tmf:tmp it
function tmf:campfire/group
