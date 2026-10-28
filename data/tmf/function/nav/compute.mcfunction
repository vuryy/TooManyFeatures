execute store result score #px tmf.tmp run data get entity @s Pos[0]
execute store result score #py tmf.tmp run data get entity @s Pos[1]
execute store result score #pz tmf.tmp run data get entity @s Pos[2]
scoreboard players operation #dx tmf.tmp = #tx tmf.tmp
scoreboard players operation #dx tmf.tmp -= #px tmf.tmp
scoreboard players operation #dy tmf.tmp = #ty tmf.tmp
scoreboard players operation #dy tmf.tmp -= #py tmf.tmp
scoreboard players operation #dz tmf.tmp = #tz tmf.tmp
scoreboard players operation #dz tmf.tmp -= #pz tmf.tmp
scoreboard players operation #ax tmf.tmp = #dx tmf.tmp
execute if score #ax tmf.tmp matches ..-1 run scoreboard players operation #ax tmf.tmp *= #m1 tmf.c
scoreboard players operation #az tmf.tmp = #dz tmf.tmp
execute if score #az tmf.tmp matches ..-1 run scoreboard players operation #az tmf.tmp *= #m1 tmf.c
scoreboard players operation #mx tmf.tmp = #ax tmf.tmp
scoreboard players operation #mx tmf.tmp > #az tmf.tmp
scoreboard players operation #mn tmf.tmp = #ax tmf.tmp
scoreboard players operation #mn tmf.tmp < #az tmf.tmp
scoreboard players set #dist tmf.tmp 0
execute if score #mx tmf.tmp matches 1..30000 run function tmf:nav/isqrt
execute if score #mx tmf.tmp matches 30001.. run function tmf:nav/approx
data modify storage tmf:tmp nv set value {a:"✔",y:""}
execute store result storage tmf:tmp nv.d int 1 run scoreboard players get #dist tmf.tmp
execute if score #dist tmf.tmp matches 3.. run function tmf:nav/dir
execute if score #dy tmf.tmp matches 3.. run function tmf:nav/height {s:"▲"}
execute if score #dy tmf.tmp matches ..-3 run function tmf:nav/height_down
