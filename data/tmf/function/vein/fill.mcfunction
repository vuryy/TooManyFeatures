$execute unless block ~ ~ ~ #$(tag) run return 0
execute if score #vbudget tmf.tmp matches ..0 run return 0
execute unless function tmf:mine/damage_tool run return 0
scoreboard players remove #vbudget tmf.tmp 1
loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~ mainhand
setblock ~ ~ ~ minecraft:air
$execute if score #silk tmf.tmp matches 0 if score #vbudget tmf.tmp matches 0.. run function tmf:vein/xp {xp:$(xp)}
playsound minecraft:block.stone.break block @a ~ ~ ~ 0.5 1
$execute positioned ~-1 ~-1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~-1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~-1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~0 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~0 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~0 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~-1 ~1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~-1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~-1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~-1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~0 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~0 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~0 ~1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~-1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~-1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~-1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~0 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~0 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~0 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~1 ~-1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~1 ~0 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
$execute positioned ~1 ~1 ~1 run function tmf:vein/fill {tag:"$(tag)",xp:$(xp)}
