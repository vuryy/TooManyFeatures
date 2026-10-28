# explosion damage of a radius-1 explosion (Normal difficulty values; the game scales them by difficulty)
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] run damage @s 10.2 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] run damage @s 3.2 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] add tmf.bh
tag @e[tag=tmf.bh,distance=..4] remove tmf.bh
