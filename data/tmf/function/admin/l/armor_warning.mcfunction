execute if score #lock_armor_warning tmf.cfg matches 1 run return run function tmf:admin/l/armor_warning_off
scoreboard players set #lock_armor_warning tmf.cfg 1
tag @a remove tmf.off.armor_warning
function tmf:admin/locks
