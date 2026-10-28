$execute as @e[type=minecraft:item,distance=..1.5,limit=1,nbt={Age:0s,Item:{id:"$(seed)"}}] run function tmf:harvest/take_seed
$setblock ~ ~ ~ $(state)
