advancement revoke @s only tmf:doors/closed_upper
execute unless score #double_doors tmf.cfg matches 1 run return 0
execute if entity @s[tag=tmf.off.double_doors] run return 0
execute if entity @s[predicate=tmf:sneaking] run return 0
data modify storage tmf:tmp door set value {open:"false"}
scoreboard players set #r tmf.tmp 0
execute at @s anchored eyes positioned ^ ^ ^ run function tmf:doors/ray
