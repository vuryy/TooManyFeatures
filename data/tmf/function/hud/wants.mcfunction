execute if score #coords_hud tmf.cfg matches 1 if entity @s[tag=tmf.on.coords_hud] run return 1
execute if score #waypoints tmf.cfg matches 1 if entity @s[tag=!tmf.off.waypoints] if score @s tmf.ws matches 1.. run return 1
return fail
