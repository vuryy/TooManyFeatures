# explosion damage of a radius-8 explosion (Normal difficulty values; the game scales them by difficulty)
particle minecraft:explosion_emitter ~ ~0.5 ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] run damage @s 107.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] run damage @s 97.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] run damage @s 88.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] run damage @s 78.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] run damage @s 70.2 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] run damage @s 61.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] run damage @s 54.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] run damage @s 46.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] run damage @s 39.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] run damage @s 33.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] run damage @s 26.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] run damage @s 21.2 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] run damage @s 15.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] run damage @s 11.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] run damage @s 6.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] run damage @s 2.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] add tmf.bh
tag @e[tag=tmf.bh,distance=..18] remove tmf.bh
