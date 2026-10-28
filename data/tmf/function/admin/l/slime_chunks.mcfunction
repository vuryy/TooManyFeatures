execute if score #lock_slime_chunks tmf.cfg matches 1 run return run function tmf:admin/l/slime_chunks_off
scoreboard players set #lock_slime_chunks tmf.cfg 1
tag @a remove tmf.off.slime_chunks
function tmf:admin/locks
