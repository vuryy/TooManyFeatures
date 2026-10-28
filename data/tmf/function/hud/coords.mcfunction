data modify storage tmf:tmp hc set value {x:0,y:0,z:0,d:"?",b:"plains"}
data modify storage tmf:tmp hc.pos set from entity @s Pos
execute store result score #x tmf.tmp run data get storage tmf:tmp hc.pos[0] 10
execute store result score #y tmf.tmp run data get storage tmf:tmp hc.pos[1] 10
execute store result score #z tmf.tmp run data get storage tmf:tmp hc.pos[2] 10
scoreboard players operation #x tmf.tmp /= #10 tmf.c
scoreboard players operation #y tmf.tmp /= #10 tmf.c
scoreboard players operation #z tmf.tmp /= #10 tmf.c
execute store result storage tmf:tmp hc.x int 1 run scoreboard players get #x tmf.tmp
execute store result storage tmf:tmp hc.y int 1 run scoreboard players get #y tmf.tmp
execute store result storage tmf:tmp hc.z int 1 run scoreboard players get #z tmf.tmp
execute store result score #yaw tmf.tmp run data get entity @s Rotation[0] 10
scoreboard players add #yaw tmf.tmp 225
scoreboard players set #k tmf.tmp 3600
scoreboard players operation #yaw tmf.tmp %= #k tmf.tmp
scoreboard players set #k tmf.tmp 450
scoreboard players operation #yaw tmf.tmp /= #k tmf.tmp
execute if score #yaw tmf.tmp matches 0 run data modify storage tmf:tmp hc.d set value "S"
execute if score #yaw tmf.tmp matches 1 run data modify storage tmf:tmp hc.d set value "SW"
execute if score #yaw tmf.tmp matches 2 run data modify storage tmf:tmp hc.d set value "W"
execute if score #yaw tmf.tmp matches 3 run data modify storage tmf:tmp hc.d set value "NW"
execute if score #yaw tmf.tmp matches 4 run data modify storage tmf:tmp hc.d set value "N"
execute if score #yaw tmf.tmp matches 5 run data modify storage tmf:tmp hc.d set value "NE"
execute if score #yaw tmf.tmp matches 6 run data modify storage tmf:tmp hc.d set value "E"
execute if score #yaw tmf.tmp matches 7 run data modify storage tmf:tmp hc.d set value "SE"
function tmf:hud/coords_m with storage tmf:tmp hc
