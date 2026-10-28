scoreboard players set @s tmf.deaths 0
execute unless score #death_glow tmf.cfg matches 1 run return 0
data modify storage tmf:tmp dg set value {dim:"minecraft:overworld",x:0,y:0,z:0}
data modify storage tmf:tmp dg.dim set from entity @s LastDeathLocation.dimension
data modify storage tmf:tmp dg.x set from entity @s LastDeathLocation.pos[0]
data modify storage tmf:tmp dg.y set from entity @s LastDeathLocation.pos[1]
data modify storage tmf:tmp dg.z set from entity @s LastDeathLocation.pos[2]
function tmf:death_glow/apply with storage tmf:tmp dg
