execute if score #pickup_notices tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_pickup_notices tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.pickup_notices] run return run function tmf:menu/p/pickup_notices_unset
tag @s add tmf.off.pickup_notices
function tmf:menu/open
