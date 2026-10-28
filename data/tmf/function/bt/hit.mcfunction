advancement revoke @s only tmf:bt/hit
tag @s add tmf.clicker
execute as @e[type=minecraft:interaction,tag=tmf.ov.bt,distance=..6] if data entity @s attack if function tmf:bt/attacked_by_me at @s run function tmf:bt/hit_overlay
tag @s remove tmf.clicker
