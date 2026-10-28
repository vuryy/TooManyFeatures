execute unless data entity @s LastDeathLocation run return run function tmf:wp/open
execute store result score @s tmf.wx run data get entity @s LastDeathLocation.pos[0]
execute store result score @s tmf.wy run data get entity @s LastDeathLocation.pos[1]
execute store result score @s tmf.wz run data get entity @s LastDeathLocation.pos[2]
data modify storage tmf:tmp dm.s set from entity @s LastDeathLocation.dimension
function tmf:util/dim_from_string
scoreboard players operation @s tmf.wd = #dc tmf.tmp
scoreboard players set @s tmf.wn 13
scoreboard players set @s tmf.ws 4
dialog clear @s
