execute if score #lock_tpa tmf.cfg matches 1 run return run function tmf:admin/l/tpa_off
scoreboard players set #lock_tpa tmf.cfg 1
tag @a remove tmf.off.tpa
function tmf:admin/locks
