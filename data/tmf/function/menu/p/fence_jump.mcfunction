execute if score #fence_jump tmf.cfg matches 0 run return run function tmf:menu/cat/movement
execute if score #lock_fence_jump tmf.cfg matches 1 run return run function tmf:menu/cat/movement
execute if entity @s[tag=tmf.on.fence_jump] run return run function tmf:menu/p/fence_jump_unset
tag @s add tmf.on.fence_jump
function tmf:menu/cat/movement
