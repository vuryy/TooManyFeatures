execute if score #lock_fence_jump tmf.cfg matches 1 run return run function tmf:admin/l/fence_jump_off
scoreboard players set #lock_fence_jump tmf.cfg 1
tag @a remove tmf.off.fence_jump
function tmf:admin/locks
