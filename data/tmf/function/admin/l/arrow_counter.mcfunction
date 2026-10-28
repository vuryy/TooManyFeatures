execute if score #lock_arrow_counter tmf.cfg matches 1 run return run function tmf:admin/l/arrow_counter_off
scoreboard players set #lock_arrow_counter tmf.cfg 1
tag @a remove tmf.off.arrow_counter
function tmf:admin/locks
