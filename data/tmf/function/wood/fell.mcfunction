scoreboard players set #vbudget tmf.tmp 200
summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags:["tmf.fs"]}
function tmf:mine/tool_init
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
$execute positioned ~0 ~0 ~0 run function tmf:wood/fill {tag:"$(tag)"}
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
execute if score #vbudget tmf.tmp matches ..199 run playsound minecraft:block.wood.break block @a ~ ~ ~ 1 0.8
kill @e[type=minecraft:marker,tag=tmf.fs]
