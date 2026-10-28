execute if score #pet_health tmf.cfg matches 0 run return run function tmf:menu/cat/mobs
execute if score #lock_pet_health tmf.cfg matches 1 run return run function tmf:menu/cat/mobs
execute if entity @s[tag=tmf.off.pet_health] run return run function tmf:menu/p/pet_health_unset
tag @s add tmf.off.pet_health
function tmf:menu/cat/mobs
