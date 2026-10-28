execute if score #horse_stats tmf.cfg matches 0 run return run function tmf:menu/cat/mobs
execute if score #lock_horse_stats tmf.cfg matches 1 run return run function tmf:menu/cat/mobs
execute if entity @s[tag=tmf.off.horse_stats] run return run function tmf:menu/p/horse_stats_unset
tag @s add tmf.off.horse_stats
function tmf:menu/cat/mobs
