execute if score #lock_copper_info tmf.cfg matches 1 run return run function tmf:admin/l/copper_info_off
scoreboard players set #lock_copper_info tmf.cfg 1
tag @a remove tmf.off.copper_info
function tmf:admin/locks
