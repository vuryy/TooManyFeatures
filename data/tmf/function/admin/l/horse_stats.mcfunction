execute if score #lock_horse_stats tmf.cfg matches 1 run return run function tmf:admin/l/horse_stats_off
scoreboard players set #lock_horse_stats tmf.cfg 1
tag @a remove tmf.off.horse_stats
function tmf:admin/locks
