scoreboard players operation #len tmf.tmp = #tick tmf.c
scoreboard players operation #len tmf.tmp -= #lt tmf.tmp
scoreboard players operation #len tmf.tmp /= #20 tmf.c
scoreboard players operation #sec tmf.tmp = #len tmf.tmp
scoreboard players operation #sec tmf.tmp /= #60 tmf.c
scoreboard players operation #hh tmf.tmp = #sec tmf.tmp
scoreboard players operation #hh tmf.tmp /= #60 tmf.c
scoreboard players operation #sec tmf.tmp %= #60 tmf.c
execute store result storage tmf:tmp ag.h int 1 run scoreboard players get #hh tmf.tmp
execute store result storage tmf:tmp ag.m int 1 run scoreboard players get #sec tmf.tmp
function tmf:insp/ago_m with storage tmf:tmp ag
