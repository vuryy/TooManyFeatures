execute if score #veinminer tmf.cfg matches 0 run return run function tmf:menu/cat/mining
execute if entity @s[tag=tmf.off.veinminer] run return run function tmf:menu/p/veinminer_unset
execute if entity @s[tag=tmf.on.veinminer] run return run function tmf:menu/p/veinminer_off
tag @s add tmf.on.veinminer
function tmf:menu/cat/mining
