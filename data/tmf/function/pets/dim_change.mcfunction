advancement revoke @s only tmf:pets/changed_dimension
execute unless score #pet_teleport tmf.cfg matches 1 run return 0
execute if entity @s[tag=tmf.off.pet_teleport] run return 0
execute unless score @s tmf.dim matches 0..3 run return 0
tag @s add tmf.pt_owner
scoreboard players set #n tmf.tmp 0
data modify storage tmf:tmp ptp set value {dim:"minecraft:overworld"}
execute if score @s tmf.dim matches 1 run data modify storage tmf:tmp ptp.dim set value "minecraft:the_nether"
execute if score @s tmf.dim matches 2 run data modify storage tmf:tmp ptp.dim set value "minecraft:the_end"
execute store result storage tmf:tmp ptp.x double 0.1 run scoreboard players get @s tmf.px
execute store result storage tmf:tmp ptp.y double 0.1 run scoreboard players get @s tmf.py
execute store result storage tmf:tmp ptp.z double 0.1 run scoreboard players get @s tmf.pz
execute if score @s tmf.dim matches 0..2 run function tmf:pets/gather with storage tmf:tmp ptp
execute if score #n tmf.tmp matches 1.. run tellraw @s [{text:"🐾 ",color:"aqua"},{score:{name:"#n",objective:"tmf.tmp"},color:"white"},{text:" of your pets followed you.",color:"gray"}]
tag @s remove tmf.pt_owner
