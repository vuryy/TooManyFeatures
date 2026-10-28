$execute positioned $(x) -64 $(z) store result score #n tmf.tmp if entity @e[type=!minecraft:player,dx=15,dy=383,dz=15]
execute if score #n tmf.tmp < #ew_limit tmf.cfg run return 0
# warn about the same chunk at most every 5 minutes
scoreboard players set #last tmf.tmp -100000
$execute if data storage tmf:data ewc."$(d)_$(cx)_$(cz)" store result score #last tmf.tmp run data get storage tmf:data ewc."$(d)_$(cx)_$(cz)"
scoreboard players operation #age tmf.tmp = #tick tmf.c
scoreboard players operation #age tmf.tmp -= #last tmf.tmp
execute if score #age tmf.tmp matches 0..5999 run return 0
$execute store result storage tmf:data ewc."$(d)_$(cx)_$(cz)" int 1 run scoreboard players get #tick tmf.c
$execute positioned $(x) -64 $(z) store result score #ni tmf.tmp if entity @e[type=minecraft:item,dx=15,dy=383,dz=15]
$execute positioned $(x) -64 $(z) store result score #nx tmf.tmp if entity @e[type=minecraft:experience_orb,dx=15,dy=383,dz=15]
$execute positioned $(x) -64 $(z) store result score #nm tmf.tmp if entity @e[type=!#tmf:no_blast,type=!minecraft:player,dx=15,dy=383,dz=15]
$tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"⚠ ",color:"yellow"},{score:{name:"#n",objective:"tmf.tmp"},color:"red",bold:true},{text:" entities in chunk ",color:"yellow"},{text:"$(cx), $(cz)",color:"white"},{text:" (blocks $(x) $(z)) near ",color:"yellow"},{selector:"@s",color:"white"},{text:" – mobs ",color:"gray"},{score:{name:"#nm",objective:"tmf.tmp"},color:"white"},{text:", items ",color:"gray"},{score:{name:"#ni",objective:"tmf.tmp"},color:"white"},{text:", XP orbs ",color:"gray"},{score:{name:"#nx",objective:"tmf.tmp"},color:"white"},{text:"  [Teleport]",color:"aqua",click_event:{action:"run_command",command:"/execute in $(dim) run tp @s $(x) $(y) $(z)"},hover_event:{action:"show_text",value:"Teleport there (operators only)"}}]
