# never overwrite a real name
execute if data entity @s CustomName unless entity @s[tag=tmf.hb] run return 0
execute store result score #hp tmf.tmp run data get entity @s Health 10
execute store result score #max tmf.tmp run attribute @s minecraft:max_health get 10
execute if score #max tmf.tmp matches ..0 run return 0
# segments (0..10), rounded up
scoreboard players operation #seg tmf.tmp = #hp tmf.tmp
scoreboard players operation #seg tmf.tmp *= #10 tmf.c
scoreboard players operation #seg tmf.tmp += #max tmf.tmp
scoreboard players remove #seg tmf.tmp 1
scoreboard players operation #seg tmf.tmp /= #max tmf.tmp
execute if score #seg tmf.tmp matches 11.. run scoreboard players set #seg tmf.tmp 10
execute if score #seg tmf.tmp matches ..-1 run scoreboard players set #seg tmf.tmp 0
data modify storage tmf:tmp hb set value {}
execute store result storage tmf:tmp hb.seg int 1 run scoreboard players get #seg tmf.tmp
scoreboard players operation #hi tmf.tmp = #hp tmf.tmp
scoreboard players operation #hi tmf.tmp /= #10 tmf.c
scoreboard players operation #hd tmf.tmp = #hp tmf.tmp
scoreboard players operation #hd tmf.tmp %= #10 tmf.c
scoreboard players operation #mi tmf.tmp = #max tmf.tmp
scoreboard players operation #mi tmf.tmp /= #10 tmf.c
execute store result storage tmf:tmp hb.hi int 1 run scoreboard players get #hi tmf.tmp
execute store result storage tmf:tmp hb.hd int 1 run scoreboard players get #hd tmf.tmp
execute store result storage tmf:tmp hb.mi int 1 run scoreboard players get #mi tmf.tmp
function tmf:combat/bar_lookup with storage tmf:tmp hb
function tmf:combat/bar_name with storage tmf:tmp hb
data modify entity @s CustomNameVisible set value 1b
tag @s add tmf.hb
scoreboard players set @s tmf.hbt 60
