execute if score #lock_magnet tmf.cfg matches 1 run return run function tmf:admin/l/magnet_off
scoreboard players set #lock_magnet tmf.cfg 1
tag @a add tmf.on.magnet
function tmf:admin/locks
