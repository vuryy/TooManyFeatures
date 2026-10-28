execute if score #slime_chunks tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_slime_chunks tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.slime_chunks] run return run function tmf:menu/p/slime_chunks_unset
tag @s add tmf.off.slime_chunks
function tmf:menu/cat/info
