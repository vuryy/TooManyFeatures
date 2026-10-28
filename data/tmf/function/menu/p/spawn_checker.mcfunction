execute if score #spawn_checker tmf.cfg matches 0 run return run function tmf:menu/cat/farming
execute if score #lock_spawn_checker tmf.cfg matches 1 run return run function tmf:menu/cat/farming
execute if entity @s[tag=tmf.off.spawn_checker] run return run function tmf:menu/p/spawn_checker_unset
tag @s add tmf.off.spawn_checker
function tmf:menu/cat/farming
