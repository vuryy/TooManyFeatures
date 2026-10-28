scoreboard players set #cat tmf.tmp 0
execute if block ~ ~ ~ #minecraft:shears_extreme_breaking_speed if items entity @s container.* minecraft:shears run return run scoreboard players set #cat tmf.tmp 5
execute if block ~ ~ ~ #minecraft:mineable/pickaxe run return run scoreboard players set #cat tmf.tmp 1
execute if block ~ ~ ~ #minecraft:mineable/axe run return run scoreboard players set #cat tmf.tmp 2
execute if block ~ ~ ~ #minecraft:mineable/shovel run return run scoreboard players set #cat tmf.tmp 3
execute if block ~ ~ ~ #minecraft:mineable/hoe run return run scoreboard players set #cat tmf.tmp 4
execute if block ~ ~ ~ #minecraft:shears_major_breaking_speed run return run scoreboard players set #cat tmf.tmp 5
execute if block ~ ~ ~ #minecraft:shears_minor_breaking_speed run return run scoreboard players set #cat tmf.tmp 5
