scoreboard players operation #pct tmf.tmp = #sp tmf.tmp
scoreboard players operation #pct tmf.tmp *= #100 tmf.c
scoreboard players operation #pct tmf.tmp /= #tt tmf.tmp
execute store result storage tmf:tmp it.pct int 1 run scoreboard players get #pct tmf.tmp
# time for this item
scoreboard players operation #left tmf.tmp = #tt tmf.tmp
scoreboard players operation #left tmf.tmp -= #sp tmf.tmp
scoreboard players operation #sec tmf.tmp = #left tmf.tmp
scoreboard players add #sec tmf.tmp 19
scoreboard players operation #sec tmf.tmp /= #20 tmf.c
function tmf:util/fmt_time
data modify storage tmf:tmp it.t set from storage tmf:tmp tf.t
# time for the whole stack
execute if score #cnt tmf.tmp matches ..1 run return 0
scoreboard players operation #sec tmf.tmp = #cnt tmf.tmp
scoreboard players remove #sec tmf.tmp 1
scoreboard players operation #sec tmf.tmp *= #tt tmf.tmp
scoreboard players operation #sec tmf.tmp += #left tmf.tmp
scoreboard players add #sec tmf.tmp 19
scoreboard players operation #sec tmf.tmp /= #20 tmf.c
function tmf:util/fmt_time
function tmf:furnace/all_m with storage tmf:tmp tf
