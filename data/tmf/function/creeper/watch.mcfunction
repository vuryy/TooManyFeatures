# dying creepers must not explode later; charged creepers explode twice as big
execute unless data entity @s {DeathTime:0s} on passengers run tag @s[tag=tmf.bl] add tmf.bl_dead
execute if entity @s[tag=!tmf.cpow] if data entity @s {powered:1b} run function tmf:creeper/powered
