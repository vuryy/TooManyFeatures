$execute unless entity @s[tag=tmf.hudbar] run bossbar add tmf:hud_$(id) ""
$bossbar set tmf:hud_$(id) players @s
$bossbar set tmf:hud_$(id) name {nbt:"hud[]",storage:"tmf:tmp",interpret:true,separator:{text:"     ",color:"dark_gray"}}
tag @s add tmf.hudbar
