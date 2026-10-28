scoreboard players set #moved tmf.tmp 0
execute unless score @s tmf.px = #x tmf.tmp run scoreboard players set #moved tmf.tmp 1
execute unless score @s tmf.py = #y tmf.tmp run scoreboard players set #moved tmf.tmp 1
execute unless score @s tmf.pz = #z tmf.tmp run scoreboard players set #moved tmf.tmp 1
execute unless score @s tmf.rx = #rx tmf.tmp run scoreboard players set #moved tmf.tmp 1
execute unless score @s tmf.ry = #ry tmf.tmp run scoreboard players set #moved tmf.tmp 1
execute if score #moved tmf.tmp matches 1 run scoreboard players set @s tmf.afk 0
execute if score #moved tmf.tmp matches 1 if entity @s[tag=tmf.afk] run function tmf:afk/back
execute if score #moved tmf.tmp matches 1 run return 0
scoreboard players add @s tmf.afk 1
scoreboard players operation #lim tmf.tmp = #afk_min tmf.cfg
scoreboard players operation #lim tmf.tmp *= #60 tmf.c
execute if entity @s[tag=!tmf.afk] if score @s tmf.afk >= #lim tmf.tmp run function tmf:afk/go
