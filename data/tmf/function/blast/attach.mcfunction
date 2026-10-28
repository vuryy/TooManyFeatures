# as the creeper / fireball; #r tmf.tmp = explosion size; #bt = 1 creeper, 2 fireball
summon minecraft:item_display ~ ~ ~ {Tags:["tmf.bl","tmf.bl_new"]}
scoreboard players operation @n[type=minecraft:item_display,tag=tmf.bl_new] tmf.cr = #r tmf.tmp
execute if score #bt tmf.tmp matches 1 run tag @n[type=minecraft:item_display,tag=tmf.bl_new] add tmf.bl_c
execute if score #bt tmf.tmp matches 2 run tag @n[type=minecraft:item_display,tag=tmf.bl_new] add tmf.bl_f
ride @n[type=minecraft:item_display,tag=tmf.bl_new] mount @s
tag @e[type=minecraft:item_display,tag=tmf.bl_new] remove tmf.bl_new
