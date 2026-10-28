scoreboard players set #pt tmf.tmp 0
$scoreboard players operation #pt tmf.tmp = $(name) tmf.s.play
scoreboard players set #de tmf.tmp 0
$scoreboard players operation #de tmf.tmp = $(name) tmf.s.deaths
scoreboard players set #mk tmf.tmp 0
$scoreboard players operation #mk tmf.tmp = $(name) tmf.s.mobs
scoreboard players set #pk tmf.tmp 0
$scoreboard players operation #pk tmf.tmp = $(name) tmf.s.pk
scoreboard players set #lx tmf.tmp 0
$scoreboard players operation #lx tmf.tmp = $(name) tmf.px
scoreboard players set #ly tmf.tmp 0
$scoreboard players operation #ly tmf.tmp = $(name) tmf.py
scoreboard players set #lz tmf.tmp 0
$scoreboard players operation #lz tmf.tmp = $(name) tmf.pz
scoreboard players set #ld tmf.tmp 0
$scoreboard players operation #ld tmf.tmp = $(name) tmf.dim
scoreboard players operation #h tmf.tmp = #pt tmf.tmp
scoreboard players operation #h tmf.tmp /= #72000 tmf.c
scoreboard players operation #m tmf.tmp = #pt tmf.tmp
scoreboard players operation #m tmf.tmp /= #1200 tmf.c
scoreboard players operation #m tmf.tmp %= #60 tmf.c
execute store result storage tmf:tmp ip.h int 1 run scoreboard players get #h tmf.tmp
execute store result storage tmf:tmp ip.m int 1 run scoreboard players get #m tmf.tmp
execute store result storage tmf:tmp ip.de int 1 run scoreboard players get #de tmf.tmp
execute store result storage tmf:tmp ip.mk int 1 run scoreboard players get #mk tmf.tmp
execute store result storage tmf:tmp ip.pk int 1 run scoreboard players get #pk tmf.tmp
scoreboard players operation #lx tmf.tmp /= #10 tmf.c
scoreboard players operation #ly tmf.tmp /= #10 tmf.c
scoreboard players operation #lz tmf.tmp /= #10 tmf.c
execute store result storage tmf:tmp ip.x int 1 run scoreboard players get #lx tmf.tmp
execute store result storage tmf:tmp ip.y int 1 run scoreboard players get #ly tmf.tmp
execute store result storage tmf:tmp ip.z int 1 run scoreboard players get #lz tmf.tmp
execute if score #ld tmf.tmp matches 0 run data modify storage tmf:tmp ip merge value {dn:"Overworld",dim:"minecraft:overworld"}
execute if score #ld tmf.tmp matches 1 run data modify storage tmf:tmp ip merge value {dn:"The Nether",dim:"minecraft:the_nether"}
execute if score #ld tmf.tmp matches 2 run data modify storage tmf:tmp ip merge value {dn:"The End",dim:"minecraft:the_end"}
execute if score #ld tmf.tmp matches 3.. run data modify storage tmf:tmp ip merge value {dn:"another dimension",dim:"minecraft:overworld"}
