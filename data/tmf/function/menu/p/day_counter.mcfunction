execute if score #day_counter tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_day_counter tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.day_counter] run return run function tmf:menu/p/day_counter_unset
tag @s add tmf.off.day_counter
function tmf:menu/open
