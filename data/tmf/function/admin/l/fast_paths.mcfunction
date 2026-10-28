execute if score #lock_fast_paths tmf.cfg matches 1 run return run function tmf:admin/l/fast_paths_off
scoreboard players set #lock_fast_paths tmf.cfg 1
tag @a add tmf.on.fast_paths
function tmf:admin/locks
