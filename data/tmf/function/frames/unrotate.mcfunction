execute store result score #rot tmf.tmp run data get entity @s ItemRotation
scoreboard players add #rot tmf.tmp 7
scoreboard players set #k tmf.tmp 8
scoreboard players operation #rot tmf.tmp %= #k tmf.tmp
execute store result entity @s ItemRotation byte 1 run scoreboard players get #rot tmf.tmp
