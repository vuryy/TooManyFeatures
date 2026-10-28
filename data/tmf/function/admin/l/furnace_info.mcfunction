execute if score #lock_furnace_info tmf.cfg matches 1 run return run function tmf:admin/l/furnace_info_off
scoreboard players set #lock_furnace_info tmf.cfg 1
tag @a remove tmf.off.furnace_info
function tmf:admin/locks
