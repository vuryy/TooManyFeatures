# explosion damage of a radius-12 explosion (Normal difficulty values; the game scales them by difficulty)
particle minecraft:explosion_emitter ~ ~0.5 ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] run damage @s 163.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] run damage @s 153.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] run damage @s 143.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] run damage @s 134.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] run damage @s 124.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] run damage @s 115.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] run damage @s 106.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] run damage @s 98.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] run damage @s 90.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] run damage @s 82.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] run damage @s 74.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] run damage @s 67.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] run damage @s 60.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] run damage @s 53.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] run damage @s 47.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] run damage @s 41.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..17] run damage @s 35.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..17] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..18] run damage @s 29.9 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..18] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..19] run damage @s 24.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..19] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..20] run damage @s 19.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..20] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..21] run damage @s 15.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..21] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..22] run damage @s 10.7 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..22] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..23] run damage @s 6.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..23] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..24] run damage @s 2.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..24] add tmf.bh
tag @e[tag=tmf.bh,distance=..26] remove tmf.bh
