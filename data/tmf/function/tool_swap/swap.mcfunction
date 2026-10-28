summon minecraft:item_display ~ ~ ~ {Tags:["tmf.swap"]}
$item replace entity @n[type=minecraft:item_display,tag=tmf.swap] contents from entity @s $(slot)
$item replace entity @s $(slot) from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @n[type=minecraft:item_display,tag=tmf.swap] contents
kill @e[type=minecraft:item_display,tag=tmf.swap]
function tmf:util/actionbar_cd
title @s actionbar [{text:"⚒ ",color:"gold"},{text:"Tool swapped – the old one is almost broken",color:"yellow"}]
playsound minecraft:item.armor.equip_generic player @s ~ ~ ~ 0.7 1.4
return 1
