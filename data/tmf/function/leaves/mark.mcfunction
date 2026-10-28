summon minecraft:marker ~ ~ ~ {Tags:["tmf.ld","tmf.ld_new"]}
scoreboard players set @e[type=minecraft:marker,tag=tmf.ld_new] tmf.ldt 0
tag @e[type=minecraft:marker,tag=tmf.ld_new] remove tmf.ld_new
