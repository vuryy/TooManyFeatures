# an enderman that was holding our invisible dummy put it down: clean it up
execute if entity @s[tag=tmf.eg] run fill ~-2 ~-1 ~-2 ~2 ~3 ~2 minecraft:air replace minecraft:structure_void
data modify entity @s carriedBlockState set value {id:"minecraft:structure_void"}
tag @s add tmf.eg
