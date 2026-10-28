tag @s add tmf.zd
execute store result score @s tmf.cr run data get entity @s CanBreakDoors
data modify entity @s CanBreakDoors set value 0b
