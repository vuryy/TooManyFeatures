$scoreboard players set @s tmf.ms $(h)
$tellraw @a [{text:"🎉 ",color:"gold"},{selector:"@s",color:"yellow"},{text:" has played for ",color:"gray"},{text:"$(h) hour(s)",color:"gold"},{text:" on this server!",color:"gray"}]
execute at @s run playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.5 1.2
