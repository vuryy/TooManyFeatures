# explosion damage of a radius-10 explosion (Normal difficulty values; the game scales them by difficulty)
particle minecraft:explosion_emitter ~ ~0.5 ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] run damage @s 135.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] run damage @s 125.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] run damage @s 115.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] run damage @s 106.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] run damage @s 97.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] run damage @s 88.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] run damage @s 80.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] run damage @s 72.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] run damage @s 64.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] run damage @s 57.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] run damage @s 50.0 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] run damage @s 43.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] run damage @s 37.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] run damage @s 31.1 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] run damage @s 25.5 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..15] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] run damage @s 20.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..16] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..17] run damage @s 15.4 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..17] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..18] run damage @s 10.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..18] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..19] run damage @s 6.6 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..19] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..20] run damage @s 2.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..20] add tmf.bh
tag @e[tag=tmf.bh,distance=..22] remove tmf.bh
