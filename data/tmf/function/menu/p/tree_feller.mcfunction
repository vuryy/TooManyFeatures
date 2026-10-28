execute if score #tree_feller tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_tree_feller tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.tree_feller] run return run function tmf:menu/p/tree_feller_unset
tag @s add tmf.off.tree_feller
function tmf:menu/open
