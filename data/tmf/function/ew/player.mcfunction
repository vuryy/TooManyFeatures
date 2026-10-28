execute store result score #ecx tmf.tmp run data get entity @s Pos[0] 0.0625
execute store result score #ecz tmf.tmp run data get entity @s Pos[2] 0.0625
execute store result storage tmf:tmp ew.y int 1 run data get entity @s Pos[1]
function tmf:util/dim_code
execute store result storage tmf:tmp ew.d int 1 run scoreboard players get #cd tmf.tmp
data modify storage tmf:tmp ew.dim set value "minecraft:overworld"
execute if dimension minecraft:the_nether run data modify storage tmf:tmp ew.dim set value "minecraft:the_nether"
execute if dimension minecraft:the_end run data modify storage tmf:tmp ew.dim set value "minecraft:the_end"
execute if score #cd tmf.tmp matches 3 run return 0
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players remove #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 0
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
scoreboard players operation #t tmf.tmp = #ecx tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cx int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.x int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp = #ecz tmf.tmp
scoreboard players add #t tmf.tmp 1
execute store result storage tmf:tmp ew.cz int 1 run scoreboard players get #t tmf.tmp
scoreboard players operation #t tmf.tmp *= #16 tmf.c
execute store result storage tmf:tmp ew.z int 1 run scoreboard players get #t tmf.tmp
function tmf:ew/chunk with storage tmf:tmp ew
