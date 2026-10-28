execute if score #waypoints tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_waypoints tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.waypoints] run return run function tmf:menu/p/waypoints_unset
tag @s add tmf.off.waypoints
function tmf:menu/cat/info
