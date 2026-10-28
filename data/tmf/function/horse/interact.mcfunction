advancement revoke @s only tmf:horse_stats/interact
execute unless score #horse_stats tmf.cfg matches 1 run return 0
execute if entity @s[tag=tmf.off.horse_stats] run return 0
tag @s add tmf.hs_player
scoreboard players set #found tmf.tmp 0
execute as @e[type=#tmf:horses,distance=..10] run function tmf:horse/candidate
execute if score #found tmf.tmp matches 0 as @e[type=#tmf:horses,distance=..6,sort=nearest,limit=1] run function tmf:horse/show
tag @s remove tmf.hs_player
