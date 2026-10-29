execute if score #tpa tmf.cfg matches 0 run return run function tmf:menu/cat/multiplayer
execute if score #lock_tpa tmf.cfg matches 1 run return run function tmf:menu/cat/multiplayer
execute if entity @s[tag=tmf.off.tpa] run return run function tmf:menu/p/tpa_unset
tag @s add tmf.off.tpa
scoreboard players set @s tmf.tpx 0
function tmf:menu/cat/multiplayer
