data modify storage tmf:tmp hud set value []
execute if score #coords_hud tmf.cfg matches 1 if entity @s[tag=tmf.on.coords_hud] run function tmf:hud/coords
execute if score #waypoints tmf.cfg matches 1 if entity @s[tag=!tmf.off.waypoints] if score @s tmf.ws matches 1.. run function tmf:wp/hud
execute store result storage tmf:tmp hb.id int 1 run scoreboard players get @s tmf.id
function tmf:hud/bar with storage tmf:tmp hb
