schedule function tmf:loop/t5 5t replace
scoreboard players add #t5 tmf.c 1

# enderman guard (every 5 ticks, every 20 in performance mode)
scoreboard players operation #m tmf.tmp = #t5 tmf.c
scoreboard players operation #m tmf.tmp %= #5 tmf.c
execute if score #enderman_guard tmf.cfg matches 1 if score #perf tmf.cfg matches 0 run function tmf:enderman/scan
execute if score #enderman_guard tmf.cfg matches 1 if score #perf tmf.cfg matches 1 if score #m tmf.tmp matches 0 run function tmf:enderman/scan

# cauldron trash
execute if score #cauldron_trash tmf.cfg matches 1 if score #perf tmf.cfg matches 0 as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:lava_cauldron run function tmf:trash/burn
execute if score #cauldron_trash tmf.cfg matches 1 if score #perf tmf.cfg matches 1 if score #m tmf.tmp matches 0 as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:lava_cauldron run function tmf:trash/burn

# health bars / damage numbers timers
execute as @e[tag=tmf.hb] run function tmf:combat/hb_tick
execute as @e[type=minecraft:text_display,tag=tmf.dn] run function tmf:combat/dn_tick

# HUD + spawn checker (every 10 ticks)
scoreboard players operation #m2 tmf.tmp = #t5 tmf.c
scoreboard players operation #m2 tmf.tmp %= #2 tmf.c
execute if score #m2 tmf.tmp matches 0 as @a at @s run function tmf:hud/tick
execute if score #spawn_checker tmf.cfg matches 1 if score #m2 tmf.tmp matches 0 as @a[tag=!tmf.off.spawn_checker,predicate=tmf:sneaking] if items entity @s weapon.mainhand #tmf:torches at @s align xyz positioned ~0.5 ~ ~0.5 run function tmf:spawn/scan

# breeding info / copper info (4x per second)
execute if score #breed_info tmf.cfg matches 1 as @a[tag=!tmf.off.breed_info,gamemode=!spectator] if items entity @s weapon.mainhand #tmf:animal_food at @s run function tmf:breed/check
# sneak + look: pet health / owner, copper, crops, campfires, furnaces
execute as @a[gamemode=!spectator,predicate=tmf:sneaking] at @s run function tmf:look/start
# held items (twice a second): arrows, compasses, slimeball
execute if score #m2 tmf.tmp matches 0 as @a[gamemode=!spectator] unless score @s tmf.abt matches 1.. at @s run function tmf:held/check

# creeper no-grief
execute if score #creeper_nogrief tmf.cfg matches 1 as @e[type=minecraft:creeper,tag=!tmf.cng] at @s run function tmf:creeper/setup
execute if score #creeper_nogrief tmf.cfg matches 1 as @a at @s as @e[type=minecraft:creeper,tag=tmf.cng,distance=..24] run function tmf:creeper/watch

# fast leaf decay markers
execute as @e[type=minecraft:marker,tag=tmf.ld] at @s run function tmf:leaves/marker_tick
