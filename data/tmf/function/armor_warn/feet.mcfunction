advancement revoke @s only tmf:armor_warn/feet
execute unless score #armor_warning tmf.cfg matches 1 run return 0
execute if entity @s[tag=tmf.off.armor_warning] run return 0
execute unless items entity @s armor.feet #minecraft:foot_armor[minecraft:damage~{durability:{max:20}}] run return 0
execute if score @s tmf.awf > #tick tmf.c run return 0
scoreboard players operation @s tmf.awf = #tick tmf.c
scoreboard players add @s tmf.awf 600
function tmf:util/actionbar_cd
title @s actionbar [{text:"⚠ ",color:"red"},{text:"Your boots is about to break!",color:"gold"}]
tellraw @s [{text:"⚠ ",color:"red"},{text:"Your boots has 20 or less durability left.",color:"gold"}]
playsound minecraft:block.anvil.land player @s ~ ~ ~ 0.3 1.8
