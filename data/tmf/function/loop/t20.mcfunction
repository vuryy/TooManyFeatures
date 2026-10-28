schedule function tmf:loop/t20 20t replace

# player position tracker (used by AFK + pet teleport)
execute as @a at @s run function tmf:player/track

# AFK sleep percentage
execute if score #afk tmf.cfg matches 1 run function tmf:afk/update_sleep

# silence mobs
execute if score #silence_mobs tmf.cfg matches 1 run function tmf:silence/scan

# pet guard equipment + owner ids
execute if score #pet_protect tmf.cfg matches 1.. as @a at @s as @e[type=#tmf:pets,distance=..48,tag=!tmf.pg] run function tmf:pets/equip


# trader alert, sapling replant, day counter, milestones
execute if score #trader_alert tmf.cfg matches 1 run function tmf:trader/scan
execute if score #sapling_replant tmf.cfg matches 1 as @e[type=minecraft:item] if items entity @s contents #minecraft:saplings at @s run function tmf:sapling/check
execute if score #day_counter tmf.cfg matches 1 run function tmf:day/check
scoreboard players add #t20 tmf.c 1
scoreboard players operation #m60 tmf.tmp = #t20 tmf.c
scoreboard players operation #m60 tmf.tmp %= #60 tmf.c
execute if score #milestones tmf.cfg matches 1 if score #m60 tmf.tmp matches 0 as @a run function tmf:milestone/check

# leave detection
function tmf:join/check_leaves
