execute if block ~ ~ ~ #tmf:sortable align xyz run return run function tmf:sort/found
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches ..55 positioned ^ ^ ^0.1 run function tmf:sort/ray
