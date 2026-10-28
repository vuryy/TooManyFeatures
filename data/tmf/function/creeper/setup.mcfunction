tag @s add tmf.cng
scoreboard players set @s tmf.cr 3
execute if data entity @s ExplosionRadius store result score @s tmf.cr run data get entity @s ExplosionRadius
data modify entity @s ExplosionRadius set value 0b
scoreboard players operation #r tmf.tmp = @s tmf.cr
scoreboard players set #bt tmf.tmp 1
function tmf:blast/attach
