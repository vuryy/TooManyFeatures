# 4000 open | 4001-4003 guide | 4004 stop | 4005 guide to last death | 4011-4013 delete | 4101-4312 save (slot, name)
execute unless score #waypoints tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.waypoints] run return run function tmf:menu/open
execute if score #v tmf.tmp matches 4000 run return run function tmf:wp/open
execute if score #v tmf.tmp matches 4001..4003 run return run function tmf:wp/guide
execute if score #v tmf.tmp matches 4004 run return run function tmf:wp/stop
execute if score #v tmf.tmp matches 4005 run return run function tmf:wp/guide_death
execute if score #v tmf.tmp matches 4011..4013 run return run function tmf:wp/delete
execute if score #v tmf.tmp matches 4101..4312 run return run function tmf:wp/save
