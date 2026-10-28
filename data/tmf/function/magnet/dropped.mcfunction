scoreboard players set @s tmf.drop 0
execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:0s} run tag @s add tmf.nomag
execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:1s} run tag @s add tmf.nomag
execute as @e[type=minecraft:item,distance=..4,tag=!tmf.nomag] if data entity @s {Age:2s} run tag @s add tmf.nomag
