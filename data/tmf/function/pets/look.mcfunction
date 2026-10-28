tag @s add tmf.hs_player
scoreboard players set #found tmf.tmp 0
execute as @e[type=#tmf:tamable,distance=..8] run function tmf:pets/look_cand
tag @s remove tmf.hs_player
execute if score #found tmf.tmp matches 1 run return 1
return fail
