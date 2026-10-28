execute unless block ~ ~ ~ #tmf:ray_pass positioned ^ ^ ^-0.3 run return run function tmf:wood/at_point
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches 55.. run return run function tmf:wood/at_point
execute positioned ^ ^ ^0.1 run function tmf:wood/ray
