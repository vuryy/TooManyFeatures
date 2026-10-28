execute if score #fast_paths tmf.cfg matches 0 run return run function tmf:menu/cat/movement
execute if score #lock_fast_paths tmf.cfg matches 1 run return run function tmf:menu/cat/movement
execute if entity @s[tag=tmf.on.fast_paths] run return run function tmf:menu/p/fast_paths_unset
tag @s add tmf.on.fast_paths
function tmf:menu/cat/movement
