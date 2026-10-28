data modify storage tmf:tmp hud set value []
execute if score #coords_hud tmf.cfg matches 1 if entity @s[tag=tmf.on.coords_hud] run function tmf:hud/coords
execute unless data storage tmf:tmp hud[0] run return 0
title @s actionbar {nbt:"hud[]",storage:"tmf:tmp",interpret:true,separator:{text:"   │   ",color:"dark_gray"}}
