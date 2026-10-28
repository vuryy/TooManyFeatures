scoreboard players operation @s tmf.fight = #tick tmf.c
scoreboard players add @s tmf.fight 60
scoreboard players set @s tmf.mine 0
execute unless score #perf tmf.cfg matches 0 run return 0
execute if score #health_bars tmf.cfg matches 0 if score #damage_numbers tmf.cfg matches 0 run return 0
scoreboard players set #found tmf.tmp 0
execute as @e[type=!#tmf:no_bar,distance=..64,nbt={HurtTime:10s},sort=nearest] unless score @s tmf.hitt = #tick tmf.c at @s run function tmf:combat/process
# killing blow: the mob is already gone, show the number where the player is looking
execute if score #found tmf.tmp matches 0 if score #damage_numbers tmf.cfg matches 1 if score #dmg tmf.tmp matches 1.. at @s anchored eyes positioned ^ ^-0.3 ^2 run function tmf:combat/number {color:"red",suffix:" ☠"}
