execute if score #harvest tmf.cfg matches 0 run return run function tmf:menu/cat/farming
execute if score #lock_harvest tmf.cfg matches 1 run return run function tmf:menu/cat/farming
execute if entity @s[tag=tmf.off.harvest] run return run function tmf:menu/p/harvest_unset
tag @s add tmf.off.harvest
function tmf:menu/cat/farming
