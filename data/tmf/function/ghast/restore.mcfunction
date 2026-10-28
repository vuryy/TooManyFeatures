execute unless score @s tmf.cr matches 0.. run scoreboard players set @s tmf.cr 1
execute store result entity @s ExplosionPower int 1 run scoreboard players get @s tmf.cr
execute on passengers if entity @s[tag=tmf.bl] run kill @s
tag @s remove tmf.gng
scoreboard players reset @s tmf.cr
