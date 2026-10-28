execute if score #lock_veinminer tmf.cfg matches 1 run return run function tmf:admin/l/veinminer_off
scoreboard players set #lock_veinminer tmf.cfg 1
tag @a remove tmf.off.veinminer
function tmf:admin/locks
