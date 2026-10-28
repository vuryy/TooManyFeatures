execute if score #crop_info tmf.cfg matches 0 run return run function tmf:menu/cat/info
execute if score #lock_crop_info tmf.cfg matches 1 run return run function tmf:menu/cat/info
execute if entity @s[tag=tmf.off.crop_info] run return run function tmf:menu/p/crop_info_unset
tag @s add tmf.off.crop_info
function tmf:menu/cat/info
