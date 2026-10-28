execute if score #ladder_drop tmf.cfg matches 0 run return run function tmf:menu/cat/farming
execute if score #lock_ladder_drop tmf.cfg matches 1 run return run function tmf:menu/cat/farming
execute if entity @s[tag=tmf.off.ladder_drop] run return run function tmf:menu/p/ladder_drop_unset
tag @s add tmf.off.ladder_drop
function tmf:menu/cat/farming
