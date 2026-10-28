# explosion damage of a radius-7 explosion (Normal difficulty values; the game scales them by difficulty)
particle minecraft:explosion_emitter ~ ~0.5 ~ 0 0 0 0 1 force
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] run damage @s 93.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..1] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] run damage @s 83.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..2] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] run damage @s 74.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..3] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] run damage @s 65.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..4] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] run damage @s 56.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..5] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] run damage @s 48.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..6] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] run damage @s 41.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..7] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] run damage @s 34.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..8] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] run damage @s 27.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..9] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] run damage @s 21.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..10] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] run damage @s 16.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..11] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] run damage @s 11.3 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..12] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] run damage @s 6.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..13] add tmf.bh
execute as @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] run damage @s 2.8 minecraft:explosion
tag @e[type=!#tmf:no_blast,tag=!tmf.bh,distance=..14] add tmf.bh
tag @e[tag=tmf.bh,distance=..16] remove tmf.bh
