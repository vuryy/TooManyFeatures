execute if data storage tmf:tmp sl{s:""} run return 0
execute if score #len tmf.sl matches 25.. run return 0
data modify storage tmf:tmp sl.c set string storage tmf:tmp sl.s 0 1
data modify storage tmf:tmp sl.s set string storage tmf:tmp sl.s 1
scoreboard players set #d tmf.sl -1
execute if data storage tmf:tmp sl{c:"0"} run scoreboard players set #d tmf.sl 0
execute if data storage tmf:tmp sl{c:"1"} run scoreboard players set #d tmf.sl 1
execute if data storage tmf:tmp sl{c:"2"} run scoreboard players set #d tmf.sl 2
execute if data storage tmf:tmp sl{c:"3"} run scoreboard players set #d tmf.sl 3
execute if data storage tmf:tmp sl{c:"4"} run scoreboard players set #d tmf.sl 4
execute if data storage tmf:tmp sl{c:"5"} run scoreboard players set #d tmf.sl 5
execute if data storage tmf:tmp sl{c:"6"} run scoreboard players set #d tmf.sl 6
execute if data storage tmf:tmp sl{c:"7"} run scoreboard players set #d tmf.sl 7
execute if data storage tmf:tmp sl{c:"8"} run scoreboard players set #d tmf.sl 8
execute if data storage tmf:tmp sl{c:"9"} run scoreboard players set #d tmf.sl 9
execute if score #d tmf.sl matches -1 run return run scoreboard players set #bad tmf.sl 1
scoreboard players add #len tmf.sl 1
scoreboard players operation #p0 tmf.sl *= #k10 tmf.sl
scoreboard players operation #p1 tmf.sl *= #k10 tmf.sl
scoreboard players operation #p2 tmf.sl *= #k10 tmf.sl
scoreboard players operation #p3 tmf.sl *= #k10 tmf.sl
scoreboard players operation #p0 tmf.sl += #d tmf.sl
scoreboard players operation #t tmf.sl = #p0 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p1 tmf.sl += #t tmf.sl
scoreboard players operation #p0 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #p1 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p2 tmf.sl += #t tmf.sl
scoreboard players operation #p1 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #p2 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p3 tmf.sl += #t tmf.sl
scoreboard players operation #p2 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #p3 tmf.sl %= #k4096 tmf.sl
function tmf:slime/parse
