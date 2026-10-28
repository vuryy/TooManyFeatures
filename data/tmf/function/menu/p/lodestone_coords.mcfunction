execute if score #lodestone_coords tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_lodestone_coords tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.lodestone_coords] run return run function tmf:menu/p/lodestone_coords_unset
tag @s add tmf.off.lodestone_coords
function tmf:menu/cat/info
