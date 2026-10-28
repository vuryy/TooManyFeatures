execute if score #animal_owners tmf.cfg matches 0 run return run function tmf:menu/cat/mobs
execute if score #lock_animal_owners tmf.cfg matches 1 run return run function tmf:menu/cat/mobs
execute if entity @s[tag=tmf.off.animal_owners] run return run function tmf:menu/p/animal_owners_unset
tag @s add tmf.off.animal_owners
function tmf:menu/cat/mobs
