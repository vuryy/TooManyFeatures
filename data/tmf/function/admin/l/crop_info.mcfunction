execute if score #lock_crop_info tmf.cfg matches 1 run return run function tmf:admin/l/crop_info_off
scoreboard players set #lock_crop_info tmf.cfg 1
tag @a remove tmf.off.crop_info
function tmf:admin/locks
