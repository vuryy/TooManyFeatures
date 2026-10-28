execute if score #lock_best_tool tmf.cfg matches 1 run return run function tmf:admin/l/best_tool_off
scoreboard players set #lock_best_tool tmf.cfg 1
tag @a add tmf.on.best_tool
function tmf:admin/locks
