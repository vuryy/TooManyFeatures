execute if score #lock_pickup_notices tmf.cfg matches 1 run return run function tmf:admin/l/pickup_notices_off
scoreboard players set #lock_pickup_notices tmf.cfg 1
tag @a remove tmf.off.pickup_notices
function tmf:admin/locks
