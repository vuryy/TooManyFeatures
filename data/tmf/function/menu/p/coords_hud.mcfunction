execute if score #coords_hud tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_coords_hud tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.on.coords_hud] run return run function tmf:menu/p/coords_hud_unset
tag @s add tmf.on.coords_hud
function tmf:menu/open
