execute if score #afk tmf.cfg matches 1.. run function tmf:afk/clear_all
scoreboard players set #afk tmf.cfg 0
tag @a remove tmf.off.fast_paths
tag @a remove tmf.off.fence_jump
tag @a remove tmf.off.biome_info
execute as @a[tag=tmf.onpath] run function tmf:paths/remove
execute as @a[tag=tmf.fj] run function tmf:fence/remove
