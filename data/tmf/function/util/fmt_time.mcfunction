# in: #sec tmf.tmp (>= 0)  out: storage tmf:tmp tf.t ("45s" or "3:07")
scoreboard players operation #fm tmf.tmp = #sec tmf.tmp
scoreboard players operation #fm tmf.tmp /= #60 tmf.c
scoreboard players operation #fs tmf.tmp = #sec tmf.tmp
scoreboard players operation #fs tmf.tmp %= #60 tmf.c
data modify storage tmf:tmp tf set value {z:""}
execute if score #fs tmf.tmp matches ..9 run data modify storage tmf:tmp tf.z set value "0"
execute store result storage tmf:tmp tf.m int 1 run scoreboard players get #fm tmf.tmp
execute store result storage tmf:tmp tf.s int 1 run scoreboard players get #fs tmf.tmp
execute if score #fm tmf.tmp matches 0 run return run function tmf:util/fmt_s with storage tmf:tmp tf
function tmf:util/fmt_ms with storage tmf:tmp tf
