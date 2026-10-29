execute at @s run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 0.8 1
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Teleported to spawn.",color:"green"}]
