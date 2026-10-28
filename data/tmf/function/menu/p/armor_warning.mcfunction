execute if score #armor_warning tmf.cfg matches 0 run return run function tmf:menu/cat/mining
execute if score #lock_armor_warning tmf.cfg matches 1 run return run function tmf:menu/cat/mining
execute if entity @s[tag=tmf.off.armor_warning] run return run function tmf:menu/p/armor_warning_unset
tag @s add tmf.off.armor_warning
function tmf:menu/cat/mining
