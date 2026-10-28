execute if score #campfire_info tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_campfire_info tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.campfire_info] run return run function tmf:menu/p/campfire_info_unset
tag @s add tmf.off.campfire_info
function tmf:menu/cat/info
