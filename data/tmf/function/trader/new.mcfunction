tag @s add tmf.wt
execute store result score #tx tmf.tmp run data get entity @s Pos[0] 10
execute store result score #tz tmf.tmp run data get entity @s Pos[2] 10
execute as @a[distance=..200,tag=tmf.on.trader_alert] run function tmf:trader/tell
