scoreboard players operation #s tmf.tmp = #v tmf.tmp
scoreboard players remove #s tmf.tmp 4000
scoreboard players operation #l tmf.tmp = #s tmf.tmp
scoreboard players operation #l tmf.tmp %= #100 tmf.c
scoreboard players operation #s tmf.tmp /= #100 tmf.c
execute unless score #l tmf.tmp matches 1..12 run return run function tmf:wp/open
execute unless score #s tmf.tmp matches 1..3 run return run function tmf:wp/open
data modify storage tmf:tmp w2 set value {}
execute store result storage tmf:tmp w2.id int 1 run scoreboard players get @s tmf.id
execute store result storage tmf:tmp w2.slot int 1 run scoreboard players get #s tmf.tmp
execute store result storage tmf:tmp w2.l int 1 run scoreboard players get #l tmf.tmp
execute store result storage tmf:tmp w2.x int 1 run data get entity @s Pos[0]
execute store result storage tmf:tmp w2.y int 1 run data get entity @s Pos[1]
execute store result storage tmf:tmp w2.z int 1 run data get entity @s Pos[2]
function tmf:util/dim_code
execute store result storage tmf:tmp w2.d int 1 run scoreboard players get #cd tmf.tmp
function tmf:wp/save_m with storage tmf:tmp w2
# keep guiding to the slot if it was overwritten
execute if score @s tmf.ws = #s tmf.tmp run function tmf:wp/guide_m with storage tmf:tmp w2
playsound minecraft:block.note_block.bell master @s ~ ~ ~ 0.5 1.5
function tmf:wp/open
