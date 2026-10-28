execute if score #sort_chest tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_sort_chest tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.on.sort_chest] run return run function tmf:menu/p/sort_chest_unset
tag @s add tmf.on.sort_chest
function tmf:menu/open
