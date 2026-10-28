execute if score #lock_day_counter tmf.cfg matches 1 run return run function tmf:admin/l/day_counter_off
scoreboard players set #lock_day_counter tmf.cfg 1
tag @a remove tmf.off.day_counter
function tmf:admin/locks
