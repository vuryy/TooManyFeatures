# the creeper / fireball this display was riding is gone
execute if entity @s[tag=tmf.bl_dead] run return run kill @s
# despawned far from players, or the difficulty was set to Peaceful
execute unless entity @a[distance=..12] run return run kill @s
execute store result score #diff tmf.tmp run difficulty
execute if score #diff tmf.tmp matches 0 run return run kill @s
scoreboard players operation #r tmf.tmp = @s tmf.cr
execute if entity @s[tag=tmf.bl_pow] run scoreboard players operation #r tmf.tmp *= #2 tmf.c
execute if score #r tmf.tmp matches 1.. if entity @s[tag=tmf.bl_c] positioned ~ ~-1.7 ~ run function tmf:blast/dispatch
execute if score #r tmf.tmp matches 1.. if entity @s[tag=tmf.bl_f] positioned ~ ~-1 ~ run function tmf:blast/dispatch
kill @s
