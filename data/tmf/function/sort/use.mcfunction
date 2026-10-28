advancement revoke @s only tmf:sort/use
execute unless score #sort_chest tmf.cfg matches 1 run return 0
execute unless entity @s[tag=tmf.on.sort_chest] run return 0
execute if items entity @s weapon.mainhand * run return 0
scoreboard players set #r tmf.tmp 0
execute at @s anchored eyes positioned ^ ^ ^ run function tmf:sort/ray
