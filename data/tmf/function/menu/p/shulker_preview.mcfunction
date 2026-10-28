execute if score #shulker_preview tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_shulker_preview tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.shulker_preview] run return run function tmf:menu/p/shulker_preview_unset
tag @s add tmf.off.shulker_preview
function tmf:menu/open
