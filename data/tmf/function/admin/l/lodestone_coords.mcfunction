execute if score #lock_lodestone_coords tmf.cfg matches 1 run return run function tmf:admin/l/lodestone_coords_off
scoreboard players set #lock_lodestone_coords tmf.cfg 1
tag @a remove tmf.off.lodestone_coords
function tmf:admin/locks
