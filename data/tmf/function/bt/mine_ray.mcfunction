execute unless block ~ ~ ~ #tmf:ray_pass run return run function tmf:bt/mine_target
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches ..46 positioned ^ ^ ^0.1 run function tmf:bt/mine_ray
