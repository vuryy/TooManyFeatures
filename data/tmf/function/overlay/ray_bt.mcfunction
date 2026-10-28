execute unless block ~ ~ ~ #tmf:ray_pass unless block ~ ~ ~ #tmf:bt_skip align xyz unless entity @s[dx=0,dy=0,dz=0] if function tmf:bt/needs_swap positioned ~0.5 ~ ~0.5 run return run function tmf:overlay/ensure {type:"bt",h:1.0,w:1.01}
execute unless block ~ ~ ~ #tmf:ray_pass run return fail
scoreboard players add #r tmf.tmp 1
execute if score #r tmf.tmp matches ..29 positioned ^ ^ ^0.1 run function tmf:overlay/ray_bt
