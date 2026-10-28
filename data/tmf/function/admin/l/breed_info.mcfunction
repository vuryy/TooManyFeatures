execute if score #lock_breed_info tmf.cfg matches 1 run return run function tmf:admin/l/breed_info_off
scoreboard players set #lock_breed_info tmf.cfg 1
tag @a remove tmf.off.breed_info
function tmf:admin/locks
