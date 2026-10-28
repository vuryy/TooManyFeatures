execute if score #fence_jump tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_fence_jump tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.fence_jump] run return run function tmf:menu/p/fence_jump_unset
tag @s add tmf.off.fence_jump
function tmf:menu/open
