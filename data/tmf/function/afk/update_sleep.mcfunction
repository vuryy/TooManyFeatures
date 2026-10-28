execute in minecraft:overworld store result score #tot tmf.tmp if entity @a[gamemode=!spectator,distance=0..]
execute in minecraft:overworld store result score #afkn tmf.tmp if entity @a[gamemode=!spectator,distance=0..,tag=tmf.afk]
scoreboard players operation #pct tmf.tmp = #sleep_pct tmf.cfg
scoreboard players operation #act tmf.tmp = #tot tmf.tmp
scoreboard players operation #act tmf.tmp -= #afkn tmf.tmp
execute if score #afkn tmf.tmp matches 1.. if score #act tmf.tmp matches 1.. run function tmf:afk/calc_pct
execute if score #pct tmf.tmp = #sleep_cur tmf.cfg run return 0
scoreboard players operation #sleep_cur tmf.cfg = #pct tmf.tmp
execute store result storage tmf:tmp sl.v int 1 run scoreboard players get #pct tmf.tmp
function tmf:afk/set_gamerule with storage tmf:tmp sl
