advancement revoke @s only tmf:frames/interact
execute unless score #invisible_frames tmf.cfg matches 1 run return 0
execute if entity @s[tag=tmf.off.invisible_frames] run return 0
tag @s add tmf.hs_player
scoreboard players set #found tmf.tmp 0
execute as @e[type=#tmf:item_frames,distance=..6] run function tmf:frames/candidate
execute if score #found tmf.tmp matches 0 as @e[type=#tmf:item_frames,distance=..4,sort=nearest,limit=1] run function tmf:frames/handle
tag @s remove tmf.hs_player
