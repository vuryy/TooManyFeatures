execute store result score #age tmf.tmp run data get entity @s Age
execute if score #age tmf.tmp matches ..599 run return 0
execute unless block ~ ~ ~ #tmf:sapling_space run return 0
execute unless block ~ ~-1 ~ #minecraft:supports_vegetation run return 0
data modify storage tmf:tmp sp set value {}
data modify storage tmf:tmp sp.id set from entity @s Item.id
function tmf:sapling/plant with storage tmf:tmp sp
execute store result score #c tmf.tmp run data get entity @s Item.count
execute if score #c tmf.tmp matches ..1 run return run kill @s
scoreboard players remove #c tmf.tmp 1
execute store result entity @s Item.count int 1 run scoreboard players get #c tmf.tmp
data modify entity @s Age set value 0s
