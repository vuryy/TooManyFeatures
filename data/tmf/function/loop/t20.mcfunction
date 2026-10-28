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

# mob griefing: zombies and door breaking; undo changes on mobs that load after a feature was switched off
execute if score #zombie_doors tmf.cfg matches 1 as @e[type=#tmf:door_breakers,tag=!tmf.zd] run function tmf:zombie/setup
execute unless score #zombie_doors tmf.cfg matches 1 as @e[type=#tmf:door_breakers,tag=tmf.zd] run function tmf:zombie/restore
execute unless score #creeper_nogrief tmf.cfg matches 1 as @e[type=minecraft:creeper,tag=tmf.cng] run function tmf:creeper/restore
execute unless score #ghast_nogrief tmf.cfg matches 1 as @e[type=minecraft:fireball,tag=tmf.gng] run function tmf:ghast/restore

# campfire regen (warmth message as soon as you are near, healing every 5 seconds)
scoreboard players operation #m5 tmf.tmp = #t20 tmf.c
scoreboard players operation #m5 tmf.tmp %= #5 tmf.c
execute if score #campfire_regen tmf.cfg matches 1 as @a[gamemode=!spectator,gamemode=!creative] at @s run function tmf:regen/check

# biome change info
execute if score #biome_info tmf.cfg matches 1 as @a[tag=tmf.on.biome_info,gamemode=!spectator] at @s run function tmf:biome/check

# entity crowd warning (every 30 seconds)
scoreboard players operation #m30 tmf.tmp = #t20 tmf.c
scoreboard players set #k tmf.tmp 30
scoreboard players operation #m30 tmf.tmp %= #k tmf.tmp
execute if score #entity_warning tmf.cfg matches 1 if score #m30 tmf.tmp matches 0 as @a at @s run function tmf:ew/player

# leave detection
function tmf:join/check_leaves
