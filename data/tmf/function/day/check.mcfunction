execute store result score #day tmf.tmp run time query minecraft:day repetition
scoreboard players add #day tmf.tmp 1
execute if score #day tmf.tmp = #lastday tmf.cfg run return 0
execute unless score #lastday tmf.cfg matches 1.. run return run scoreboard players operation #lastday tmf.cfg = #day tmf.tmp
scoreboard players operation #lastday tmf.cfg = #day tmf.tmp
execute as @a[tag=!tmf.off.day_counter] run function tmf:day/announce
