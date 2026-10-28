execute if block ~ ~ ~ #tmf:doors align xyz run return run function tmf:doors/found
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches ..60 positioned ^ ^ ^0.1 run function tmf:doors/ray
