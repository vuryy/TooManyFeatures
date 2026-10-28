execute if score #lock_harvest tmf.cfg matches 1 run return run function tmf:admin/l/harvest_off
scoreboard players set #lock_harvest tmf.cfg 1
tag @a remove tmf.off.harvest
function tmf:admin/locks
