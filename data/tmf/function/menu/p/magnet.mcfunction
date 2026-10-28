execute if score #magnet tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_magnet tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.on.magnet] run return run function tmf:menu/p/magnet_unset
tag @s add tmf.on.magnet
function tmf:menu/open
