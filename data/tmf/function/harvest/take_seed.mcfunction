execute store result score #c tmf.tmp run data get entity @s Item.count
execute if score #c tmf.tmp matches ..1 run return run kill @s
scoreboard players remove #c tmf.tmp 1
execute store result entity @s Item.count int 1 run scoreboard players get #c tmf.tmp
