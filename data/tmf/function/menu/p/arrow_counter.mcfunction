execute if score #arrow_counter tmf.cfg matches 0 run return run function tmf:menu/cat/combat
execute if score #lock_arrow_counter tmf.cfg matches 1 run return run function tmf:menu/cat/combat
execute if entity @s[tag=tmf.off.arrow_counter] run return run function tmf:menu/p/arrow_counter_unset
tag @s add tmf.off.arrow_counter
function tmf:menu/cat/combat
