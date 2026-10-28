execute if score #copper_info tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_copper_info tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.copper_info] run return run function tmf:menu/p/copper_info_unset
tag @s add tmf.off.copper_info
function tmf:menu/cat/info
