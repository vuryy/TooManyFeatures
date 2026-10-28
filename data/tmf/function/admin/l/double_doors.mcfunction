execute if score #lock_double_doors tmf.cfg matches 1 run return run function tmf:admin/l/double_doors_off
scoreboard players set #lock_double_doors tmf.cfg 1
tag @a remove tmf.off.double_doors
function tmf:admin/locks
