tag @s add tmf.hs_player
scoreboard players set #found tmf.tmp 0
execute as @e[type=#tmf:breedable,distance=..6] run function tmf:breed/candidate
tag @s remove tmf.hs_player
