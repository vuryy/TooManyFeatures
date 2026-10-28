execute if score #breed_info tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_breed_info tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.breed_info] run return run function tmf:menu/p/breed_info_unset
tag @s add tmf.off.breed_info
function tmf:menu/open
