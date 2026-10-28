execute unless score @s tmf.cr matches 0..127 run scoreboard players set @s tmf.cr 3
execute store result entity @s ExplosionRadius byte 1 run scoreboard players get @s tmf.cr
execute on passengers if entity @s[tag=tmf.bl] run kill @s
tag @s remove tmf.cng
tag @s remove tmf.cpow
scoreboard players reset @s tmf.cr
