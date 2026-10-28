execute if score #double_doors tmf.cfg matches 0 run return run function tmf:menu/cat/farming
execute if score #lock_double_doors tmf.cfg matches 1 run return run function tmf:menu/cat/farming
execute if entity @s[tag=tmf.off.double_doors] run return run function tmf:menu/p/double_doors_unset
tag @s add tmf.off.double_doors
function tmf:menu/cat/farming
