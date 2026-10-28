execute if score #lock_waypoints tmf.cfg matches 1 run return run function tmf:admin/l/waypoints_off
scoreboard players set #lock_waypoints tmf.cfg 1
tag @a remove tmf.off.waypoints
function tmf:admin/locks
