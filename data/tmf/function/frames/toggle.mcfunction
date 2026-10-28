execute if data entity @s {Invisible:1b} run return run function tmf:frames/show
data modify entity @s Invisible set value 1b
execute at @s run playsound minecraft:entity.sheep.shear player @a ~ ~ ~ 0.7 1.5
