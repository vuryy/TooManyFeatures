execute if score #lock_biome_info tmf.cfg matches 1 run return run function tmf:admin/l/biome_info_off
scoreboard players set #lock_biome_info tmf.cfg 1
tag @a add tmf.on.biome_info
function tmf:admin/locks
