execute if score #lock_ladder_drop tmf.cfg matches 1 run return run function tmf:admin/l/ladder_drop_off
scoreboard players set #lock_ladder_drop tmf.cfg 1
tag @a remove tmf.off.ladder_drop
function tmf:admin/locks
