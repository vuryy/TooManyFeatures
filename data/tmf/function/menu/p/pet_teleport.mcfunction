execute if score #pet_teleport tmf.cfg matches 0 run return run function tmf:menu/cat/mobs
execute if score #lock_pet_teleport tmf.cfg matches 1 run return run function tmf:menu/cat/mobs
execute if entity @s[tag=tmf.off.pet_teleport] run return run function tmf:menu/p/pet_teleport_unset
tag @s add tmf.off.pet_teleport
function tmf:menu/cat/mobs
