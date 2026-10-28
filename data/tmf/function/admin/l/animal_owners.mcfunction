execute if score #lock_animal_owners tmf.cfg matches 1 run return run function tmf:admin/l/animal_owners_off
scoreboard players set #lock_animal_owners tmf.cfg 1
tag @a remove tmf.off.animal_owners
function tmf:admin/locks
