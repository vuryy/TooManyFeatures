execute if score #fast_paths tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_fast_paths tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.fast_paths] run return run function tmf:menu/p/fast_paths_unset
tag @s add tmf.off.fast_paths
execute if entity @s[tag=tmf.onpath] run function tmf:paths/remove
function tmf:menu/open
