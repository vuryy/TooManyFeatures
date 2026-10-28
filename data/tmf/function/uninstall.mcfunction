# restore game rules
execute if score #no_phantoms tmf.cfg matches 1 if score #phantoms_orig tmf.cfg matches 1 run gamerule spawn_phantoms true
scoreboard players set #afk tmf.cfg 0
function tmf:afk/restore_sleep
# clean up entities and players
execute as @a[tag=tmf.onpath] run function tmf:paths/remove
function tmf:enderman/strip_all
function tmf:combat/clear_all
function tmf:silence/off_all
function tmf:afk/clear_all
execute as @e[tag=tmf.pg] run function tmf:pets/unequip
kill @e[type=minecraft:interaction,tag=tmf.ov]
kill @e[type=minecraft:marker,tag=tmf.ld]
kill @e[type=minecraft:marker,tag=tmf.plog]
kill @e[type=minecraft:marker,tag=tmf.fs]
execute as @a[tag=tmf.ntsf] run function tmf:trample/landed
execute as @a[tag=tmf.fj] run function tmf:fence/remove
tag @e[type=minecraft:armor_stand,tag=tmf.edit] remove tmf.edit
kill @e[type=minecraft:item_display,tag=tmf.swap]
kill @e[type=minecraft:item_display,tag=tmf.namebuf]
tag @e[tag=tmf.dg] remove tmf.dg
tag @e[tag=tmf.eg] remove tmf.eg
tag @a remove tmf.off.tool_swap
tag @a remove tmf.off.shulker_preview
tag @a remove tmf.off.fast_paths
tag @a remove tmf.off.horse_stats
tag @a remove tmf.off.pet_teleport
tag @a remove tmf.off.ladder_drop
tag @a remove tmf.off.double_doors
tag @a remove tmf.off.harvest
tag @a remove tmf.off.invisible_frames
tag @a remove tmf.off.armor_warning
tag @a remove tmf.off.best_tool
tag @a remove tmf.off.coords_hud
tag @a remove tmf.off.spawn_checker
tag @a remove tmf.off.veinminer
tag @a remove tmf.off.tree_feller
tag @a remove tmf.off.trader_alert
tag @a remove tmf.off.sort_chest
tag @a remove tmf.off.pickup_notices
tag @a remove tmf.off.magnet
tag @a remove tmf.off.breed_info
tag @a remove tmf.off.copper_info
tag @a remove tmf.off.day_counter
tag @a remove tmf.off.fence_jump
tag @a remove tmf.on.tool_swap
tag @a remove tmf.on.shulker_preview
tag @a remove tmf.on.fast_paths
tag @a remove tmf.on.horse_stats
tag @a remove tmf.on.pet_teleport
tag @a remove tmf.on.ladder_drop
tag @a remove tmf.on.double_doors
tag @a remove tmf.on.harvest
tag @a remove tmf.on.invisible_frames
tag @a remove tmf.on.armor_warning
tag @a remove tmf.on.best_tool
tag @a remove tmf.on.coords_hud
tag @a remove tmf.on.spawn_checker
tag @a remove tmf.on.veinminer
tag @a remove tmf.on.tree_feller
tag @a remove tmf.on.trader_alert
tag @a remove tmf.on.sort_chest
tag @a remove tmf.on.pickup_notices
tag @a remove tmf.on.magnet
tag @a remove tmf.on.breed_info
tag @a remove tmf.on.copper_info
tag @a remove tmf.on.day_counter
tag @a remove tmf.on.fence_jump
tag @a remove tmf.known
tag @a remove tmf.sneaking
tag @a[tag=tmf.admin] remove tmf.admin
team remove tmf.afk
schedule clear tmf:loop/t5
schedule clear tmf:loop/t20
scoreboard objectives remove tmf.cfg
scoreboard objectives remove tmf.tmp
scoreboard objectives remove tmf.c
scoreboard objectives remove tmf.id
scoreboard objectives remove tmf.oid
scoreboard objectives remove tmf.cd
scoreboard objectives remove tmf.hp
scoreboard objectives remove tmf.lhp
scoreboard objectives remove tmf.hbt
scoreboard objectives remove tmf.dnt
scoreboard objectives remove tmf.hitt
scoreboard objectives remove tmf.afk
scoreboard objectives remove tmf.px
scoreboard objectives remove tmf.py
scoreboard objectives remove tmf.pz
scoreboard objectives remove tmf.rx
scoreboard objectives remove tmf.ry
scoreboard objectives remove tmf.dim
scoreboard objectives remove tmf.sess
scoreboard objectives remove tmf.abt
scoreboard objectives remove tmf.swapcd
scoreboard objectives remove tmf.share
scoreboard objectives remove tmf.mine
scoreboard objectives remove tmf.fight
scoreboard objectives remove tmf.ldt
scoreboard objectives remove tmf.pcd
scoreboard objectives remove tmf.awh
scoreboard objectives remove tmf.awc
scoreboard objectives remove tmf.awl
scoreboard objectives remove tmf.awf
scoreboard objectives remove tmf.awe
scoreboard objectives remove tmf.btsup
scoreboard objectives remove tmf.ms
scoreboard objectives remove tmf
scoreboard objectives remove tmf.stats
scoreboard objectives remove tmf.deaths
scoreboard objectives remove tmf.leave
scoreboard objectives remove tmf.s.play
scoreboard objectives remove tmf.s.deaths
scoreboard objectives remove tmf.s.mobs
scoreboard objectives remove tmf.s.pk
scoreboard objectives remove tmf.s.walk
scoreboard objectives remove tmf.s.sprint
scoreboard objectives remove tmf.s.crouch
scoreboard objectives remove tmf.s.swim
scoreboard objectives remove tmf.s.wow
scoreboard objectives remove tmf.s.wuw
scoreboard objectives remove tmf.s.climb
scoreboard objectives remove tmf.s.fly
scoreboard objectives remove tmf.s.boat
scoreboard objectives remove tmf.s.horse
scoreboard objectives remove tmf.s.cart
scoreboard objectives remove tmf.s.pig
scoreboard objectives remove tmf.s.strider
scoreboard objectives remove tmf.s.ghast
scoreboard objectives remove tmf.s.naut
scoreboard objectives remove tmf.s.jump
scoreboard objectives remove tmf.s.dmgd
scoreboard objectives remove tmf.s.dmgt
scoreboard objectives remove tmf.s.since
scoreboard objectives remove tmf.s.fish
scoreboard objectives remove tmf.s.bred
scoreboard objectives remove tmf.s.trade
scoreboard objectives remove tmf.s.ench
scoreboard objectives remove tmf.s.sleep
scoreboard objectives remove tmf.lg.0
scoreboard objectives remove tmf.lg.1
scoreboard objectives remove tmf.lg.2
scoreboard objectives remove tmf.lg.3
scoreboard objectives remove tmf.lg.4
scoreboard objectives remove tmf.lg.5
scoreboard objectives remove tmf.lg.6
scoreboard objectives remove tmf.lg.7
scoreboard objectives remove tmf.lg.8
scoreboard objectives remove tmf.lg.9
scoreboard objectives remove tmf.lg.10
scoreboard objectives remove tmf.lg.11
scoreboard objectives remove tmf.lg.12
scoreboard objectives remove tmf.lg.13
scoreboard objectives remove tmf.lg.14
scoreboard objectives remove tmf.lg.15
scoreboard objectives remove tmf.lg.16
scoreboard objectives remove tmf.lg.17
scoreboard objectives remove tmf.lg.18
scoreboard objectives remove tmf.lg.19
scoreboard objectives remove tmf.lg.20
scoreboard objectives remove tmf.lg.21
scoreboard objectives remove tmf.lg.22
scoreboard objectives remove tmf.lg.23
scoreboard objectives remove tmf.lg.24
scoreboard objectives remove tmf.lg.25
scoreboard objectives remove tmf.lg.26
scoreboard objectives remove tmf.lg.27
scoreboard objectives remove tmf.lg.28
scoreboard objectives remove tmf.lg.29
scoreboard objectives remove tmf.lg.30
scoreboard objectives remove tmf.lg.31
scoreboard objectives remove tmf.lg.32
scoreboard objectives remove tmf.lg.33
scoreboard objectives remove tmf.lg.34
scoreboard objectives remove tmf.lg.35
scoreboard objectives remove tmf.lg.36
scoreboard objectives remove tmf.lg.37
scoreboard objectives remove tmf.lg.38
scoreboard objectives remove tmf.lg.39
scoreboard objectives remove tmf.lg.40
scoreboard objectives remove tmf.lg.41
scoreboard objectives remove tmf.lg.42
scoreboard objectives remove tmf.lg.43
scoreboard objectives remove tmf.lg.44
scoreboard objectives remove tmf.lg.45
scoreboard objectives remove tmf.lg.46
scoreboard objectives remove tmf.lg.47
scoreboard objectives remove tmf.drop
scoreboard objectives remove tmf.or.0
scoreboard objectives remove tmf.or.1
scoreboard objectives remove tmf.or.2
scoreboard objectives remove tmf.or.3
scoreboard objectives remove tmf.or.4
scoreboard objectives remove tmf.or.5
scoreboard objectives remove tmf.or.6
scoreboard objectives remove tmf.or.7
scoreboard objectives remove tmf.or.8
scoreboard objectives remove tmf.or.9
scoreboard objectives remove tmf.or.10
scoreboard objectives remove tmf.or.11
scoreboard objectives remove tmf.or.12
scoreboard objectives remove tmf.or.13
scoreboard objectives remove tmf.or.14
scoreboard objectives remove tmf.or.15
scoreboard objectives remove tmf.or.16
scoreboard objectives remove tmf.or.17
scoreboard objectives remove tmf.or.18
data remove storage tmf:data online
data remove storage tmf:data bars
data remove storage tmf:data version
data remove storage tmf:tmp d
tellraw @a [{text:"[TMF] ",color:"gold"},{text:"Uninstalled. Now remove the TMF folder from the world's datapacks folder (or disable it with /datapack disable) and run /reload.",color:"gray"}]
