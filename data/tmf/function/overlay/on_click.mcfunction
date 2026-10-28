advancement revoke @s only tmf:overlay/click
tag @s add tmf.clicker
execute as @e[type=minecraft:interaction,tag=tmf.ov,distance=..6] if function tmf:overlay/clicked_by_me at @s run function tmf:overlay/handle
tag @s remove tmf.clicker
