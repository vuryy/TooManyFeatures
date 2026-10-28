execute if score #lock_campfire_info tmf.cfg matches 1 run return run function tmf:admin/l/campfire_info_off
scoreboard players set #lock_campfire_info tmf.cfg 1
tag @a remove tmf.off.campfire_info
function tmf:admin/locks
