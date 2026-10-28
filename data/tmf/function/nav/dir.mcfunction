scoreboard players operation #t tmf.tmp = #tx tmf.tmp
scoreboard players operation #t tmf.tmp *= #10 tmf.c
execute store result storage tmf:tmp nf.x double 0.1 run scoreboard players add #t tmf.tmp 5
scoreboard players operation #t tmf.tmp = #tz tmf.tmp
scoreboard players operation #t tmf.tmp *= #10 tmf.c
execute store result storage tmf:tmp nf.z double 0.1 run scoreboard players add #t tmf.tmp 5
summon minecraft:marker ~ ~ ~ {Tags:["tmf.nav"]}
function tmf:nav/face with storage tmf:tmp nf
execute store result score #tyaw tmf.tmp run data get entity @n[type=minecraft:marker,tag=tmf.nav] Rotation[0] 10
kill @e[type=minecraft:marker,tag=tmf.nav]
execute store result score #rel tmf.tmp run data get entity @s Rotation[0] 10
scoreboard players operation #rel tmf.tmp *= #m1 tmf.c
scoreboard players operation #rel tmf.tmp += #tyaw tmf.tmp
# +225 to round to the nearest of 8 directions, plus a large multiple of 360 degrees to stay positive
scoreboard players add #rel tmf.tmp 360000225
scoreboard players set #k tmf.tmp 3600
scoreboard players operation #rel tmf.tmp %= #k tmf.tmp
scoreboard players set #k tmf.tmp 450
scoreboard players operation #rel tmf.tmp /= #k tmf.tmp
execute if score #rel tmf.tmp matches 0 run data modify storage tmf:tmp nv.a set value "↑"
execute if score #rel tmf.tmp matches 1 run data modify storage tmf:tmp nv.a set value "↗"
execute if score #rel tmf.tmp matches 2 run data modify storage tmf:tmp nv.a set value "→"
execute if score #rel tmf.tmp matches 3 run data modify storage tmf:tmp nv.a set value "↘"
execute if score #rel tmf.tmp matches 4 run data modify storage tmf:tmp nv.a set value "↓"
execute if score #rel tmf.tmp matches 5 run data modify storage tmf:tmp nv.a set value "↙"
execute if score #rel tmf.tmp matches 6 run data modify storage tmf:tmp nv.a set value "←"
execute if score #rel tmf.tmp matches 7 run data modify storage tmf:tmp nv.a set value "↖"
