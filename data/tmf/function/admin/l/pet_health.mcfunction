execute if score #lock_pet_health tmf.cfg matches 1 run return run function tmf:admin/l/pet_health_off
scoreboard players set #lock_pet_health tmf.cfg 1
tag @a remove tmf.off.pet_health
function tmf:admin/locks
