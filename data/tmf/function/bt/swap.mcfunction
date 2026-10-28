scoreboard players operation @s tmf.mine = #tick tmf.c
scoreboard players add @s tmf.mine 100
summon minecraft:item_display ~ ~ ~ {Tags:["tmf.swap"]}
$item replace entity @n[type=minecraft:item_display,tag=tmf.swap] contents from entity @s $(slot)
$item replace entity @s $(slot) from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @n[type=minecraft:item_display,tag=tmf.swap] contents
kill @e[type=minecraft:item_display,tag=tmf.swap]
playsound minecraft:item.armor.equip_generic player @s ~ ~ ~ 0.3 1.8
return 1
