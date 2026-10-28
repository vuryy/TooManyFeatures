execute if score #best_tool tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_best_tool tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.on.best_tool] run return run function tmf:menu/p/best_tool_unset
tag @s add tmf.on.best_tool
function tmf:menu/open
