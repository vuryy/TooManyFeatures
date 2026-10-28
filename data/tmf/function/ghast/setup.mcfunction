tag @s add tmf.gng
scoreboard players set @s tmf.cr 1
execute if data entity @s ExplosionPower store result score @s tmf.cr run data get entity @s ExplosionPower
data modify entity @s ExplosionPower set value 0
scoreboard players operation #r tmf.tmp = @s tmf.cr
scoreboard players set #bt tmf.tmp 2
function tmf:blast/attach
