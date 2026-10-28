execute if score #lock_spawn_checker tmf.cfg matches 1 run return run function tmf:admin/l/spawn_checker_off
scoreboard players set #lock_spawn_checker tmf.cfg 1
tag @a remove tmf.off.spawn_checker
function tmf:admin/locks
