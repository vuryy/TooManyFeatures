execute if score #found tmf.tmp matches 1 run return 0
scoreboard players set #found tmf.tmp 1
scoreboard players operation @s tmf.hitt = #tick tmf.c
execute if score #damage_numbers tmf.cfg matches 1 if score #dmg tmf.tmp matches 1.. anchored eyes positioned ^ ^0.5 ^ run function tmf:combat/number {color:"gold",suffix:""}
execute if score #health_bars tmf.cfg matches 1 run function tmf:combat/health_bar
