execute if score #tool_swap tmf.cfg matches 0 run return run function tmf:menu/cat/mining
execute if score #lock_tool_swap tmf.cfg matches 1 run return run function tmf:menu/cat/mining
execute if entity @s[tag=tmf.on.tool_swap] run return run function tmf:menu/p/tool_swap_unset
tag @s add tmf.on.tool_swap
function tmf:menu/cat/mining
