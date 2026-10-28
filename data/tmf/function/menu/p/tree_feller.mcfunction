execute if score #tree_feller tmf.cfg matches 0 run return run function tmf:menu/cat/mining
execute if entity @s[tag=tmf.off.tree_feller] run return run function tmf:menu/p/tree_feller_unset
execute if entity @s[tag=tmf.on.tree_feller] run return run function tmf:menu/p/tree_feller_off
tag @s add tmf.on.tree_feller
function tmf:menu/cat/mining
