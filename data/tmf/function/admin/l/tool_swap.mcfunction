execute if score #lock_tool_swap tmf.cfg matches 1 run return run function tmf:admin/l/tool_swap_off
scoreboard players set #lock_tool_swap tmf.cfg 1
tag @a add tmf.on.tool_swap
function tmf:admin/locks
