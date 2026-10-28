execute if score #veinminer tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_veinminer tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.veinminer] run return run function tmf:menu/p/veinminer_unset
tag @s add tmf.off.veinminer
function tmf:menu/open
