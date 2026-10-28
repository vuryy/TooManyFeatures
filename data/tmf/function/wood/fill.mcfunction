$execute unless block ~ ~ ~ #$(tag) run return 0
# stay within 7 blocks sideways of the chopped log and never go below it
execute positioned ~-7 ~-40 ~-7 unless entity @e[type=minecraft:marker,tag=tmf.fs,dx=14,dy=41,dz=14] run return 0
execute if score #vbudget tmf.tmp matches ..0 run return 0
execute unless function tmf:mine/damage_tool run return 0
scoreboard players remove #vbudget tmf.tmp 1
loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~ mainhand
setblock ~ ~ ~ minecraft:air
execute if score #leaf_decay tmf.cfg matches 1 unless entity @e[type=minecraft:marker,tag=tmf.ld,distance=..4] if function tmf:wood/near_leaves positioned ~0.5 ~0.5 ~0.5 run function tmf:leaves/mark
$execute positioned ~-1 ~-1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~-1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~-1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~0 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~0 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~0 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~-1 ~1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~-1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~-1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~-1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~0 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~0 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~0 ~1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~-1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~-1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~-1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~0 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~0 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~0 ~1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~1 ~-1 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~1 ~0 run function tmf:wood/fill {tag:"$(tag)"}
$execute positioned ~1 ~1 ~1 run function tmf:wood/fill {tag:"$(tag)"}
