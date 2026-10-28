scoreboard players add #d tmf.tmp 1
execute if score #d tmf.tmp matches 400.. run return fail
execute if block ~ ~-1 ~ minecraft:ladder positioned ~ ~-1 ~ run return run function tmf:ladder/descend
execute positioned ~ ~-1 ~ run function tmf:ladder/place
