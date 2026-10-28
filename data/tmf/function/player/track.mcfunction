data modify storage tmf:tmp pt set value {}
data modify storage tmf:tmp pt.pos set from entity @s Pos
data modify storage tmf:tmp pt.rot set from entity @s Rotation
execute store result score #x tmf.tmp run data get storage tmf:tmp pt.pos[0] 10
execute store result score #y tmf.tmp run data get storage tmf:tmp pt.pos[1] 10
execute store result score #z tmf.tmp run data get storage tmf:tmp pt.pos[2] 10
execute store result score #rx tmf.tmp run data get storage tmf:tmp pt.rot[0]
execute store result score #ry tmf.tmp run data get storage tmf:tmp pt.rot[1]
scoreboard players set #dim tmf.tmp 3
execute if dimension minecraft:overworld run scoreboard players set #dim tmf.tmp 0
execute if dimension minecraft:the_nether run scoreboard players set #dim tmf.tmp 1
execute if dimension minecraft:the_end run scoreboard players set #dim tmf.tmp 2

execute if score #afk tmf.cfg matches 1 run function tmf:afk/check

scoreboard players operation @s tmf.px = #x tmf.tmp
scoreboard players operation @s tmf.py = #y tmf.tmp
scoreboard players operation @s tmf.pz = #z tmf.tmp
scoreboard players operation @s tmf.rx = #rx tmf.tmp
scoreboard players operation @s tmf.ry = #ry tmf.tmp
scoreboard players operation @s tmf.dim = #dim tmf.tmp
