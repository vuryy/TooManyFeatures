execute unless entity @s[tag=tmf.admin] run return fail
$data modify storage tmf:tmp sl set value {s:"$(s)"}
scoreboard players set #p0 tmf.sl 0
scoreboard players set #p1 tmf.sl 0
scoreboard players set #p2 tmf.sl 0
scoreboard players set #p3 tmf.sl 0
scoreboard players set #len tmf.sl 0
scoreboard players set #bad tmf.sl 0
scoreboard players set #neg tmf.sl 0
data modify storage tmf:tmp sl.c set string storage tmf:tmp sl.s 0 1
execute if data storage tmf:tmp sl{c:"-"} run scoreboard players set #neg tmf.sl 1
execute if score #neg tmf.sl matches 1 run data modify storage tmf:tmp sl.s set string storage tmf:tmp sl.s 1
function tmf:slime/parse
execute if score #len tmf.sl matches 0 run scoreboard players set #bad tmf.sl 1
execute if score #len tmf.sl matches 20.. run scoreboard players set #bad tmf.sl 1
execute if score #bad tmf.sl matches 1 run return run tellraw @s [{text:"[TMF] ",color:"gold"},{text:"That is not a number. Copy the number that /seed shows.",color:"red"}]
execute if score #neg tmf.sl matches 1 run function tmf:slime/negate
function tmf:slime/low32
execute store result score #real tmf.sl run seed
execute unless score #lo tmf.sl = #real tmf.sl run return run tellraw @s [{text:"[TMF] ",color:"gold"},{text:"That is not this world's seed. Copy the number that /seed shows.",color:"red"}]
scoreboard players operation #seed0 tmf.cfg = #p0 tmf.sl
scoreboard players operation #seed1 tmf.cfg = #p1 tmf.sl
scoreboard players operation #seed2 tmf.cfg = #p2 tmf.sl
scoreboard players operation #seed3 tmf.cfg = #p3 tmf.sl
scoreboard players set #seed_set tmf.cfg 1
scoreboard players reset * tmf.slx
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Seed saved. Hold a slimeball to check for slime chunks.",color:"green"}]
function tmf:admin/open
