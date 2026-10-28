execute if score #lock_sort_chest tmf.cfg matches 1 run return run function tmf:admin/l/sort_chest_off
scoreboard players set #lock_sort_chest tmf.cfg 1
tag @a add tmf.on.sort_chest
function tmf:admin/locks
