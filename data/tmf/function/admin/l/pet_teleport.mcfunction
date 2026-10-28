execute if score #lock_pet_teleport tmf.cfg matches 1 run return run function tmf:admin/l/pet_teleport_off
scoreboard players set #lock_pet_teleport tmf.cfg 1
tag @a remove tmf.off.pet_teleport
function tmf:admin/locks
