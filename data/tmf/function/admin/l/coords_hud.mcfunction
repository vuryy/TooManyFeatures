execute if score #lock_coords_hud tmf.cfg matches 1 run return run function tmf:admin/l/coords_hud_off
scoreboard players set #lock_coords_hud tmf.cfg 1
tag @a add tmf.on.coords_hud
function tmf:admin/locks
