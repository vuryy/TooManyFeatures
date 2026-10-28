execute if score #shown tmf.tmp matches 5.. run data modify storage tmf:tmp pk.lines append value {text:"…",color:"dark_gray"}
scoreboard players set @s tmf.abt 30
title @s actionbar {nbt:"pk.lines[]",storage:"tmf:tmp",interpret:true,separator:{text:"   "}}
