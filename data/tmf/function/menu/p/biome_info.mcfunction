execute if score #biome_info tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_biome_info tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.on.biome_info] run return run function tmf:menu/p/biome_info_unset
tag @s add tmf.on.biome_info
function tmf:menu/cat/info
