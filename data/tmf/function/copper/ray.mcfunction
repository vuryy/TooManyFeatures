execute unless block ~ ~ ~ #tmf:ray_pass run return run function tmf:copper/hit
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches ..50 positioned ^ ^ ^0.1 run function tmf:copper/ray
