execute unless function tmf:regen/near run return run tag @s remove tmf.warm
execute if entity @s[tag=!tmf.warm] run function tmf:regen/enter
execute unless score #m5 tmf.tmp matches 0 run return 0
execute store result score #h tmf.tmp run data get entity @s Health
execute store result score #mh tmf.tmp run attribute @s minecraft:max_health get
execute if score #h tmf.tmp >= #mh tmf.tmp run return 0
effect give @s minecraft:regeneration 3 1 true
