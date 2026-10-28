execute unless block ~ ~ ~ #minecraft:leaves[persistent=false,distance=7] run return 0
execute if score #budget tmf.tmp matches ..0 run return 0
scoreboard players remove #budget tmf.tmp 1
loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~
setblock ~ ~ ~ minecraft:air
execute positioned ~1 ~ ~ run function tmf:leaves/fill
execute positioned ~-1 ~ ~ run function tmf:leaves/fill
execute positioned ~ ~1 ~ run function tmf:leaves/fill
execute positioned ~ ~-1 ~ run function tmf:leaves/fill
execute positioned ~ ~ ~1 run function tmf:leaves/fill
execute positioned ~ ~ ~-1 run function tmf:leaves/fill
