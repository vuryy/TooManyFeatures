execute if score #furnace_info tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_furnace_info tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.furnace_info] run return run function tmf:menu/p/furnace_info_unset
tag @s add tmf.off.furnace_info
function tmf:menu/cat/info
