$function tmf:tpa/check {id:$(id)}
execute if score #ok tmf.tmp matches 0 run return run function tmf:tpa/expired
$scoreboard players set @a[scores={tmf.id=$(id)}] tmf.tpx 0
$scoreboard players reset @a[scores={tmf.id=$(id)}] tmf.tpt
$tellraw @a[scores={tmf.id=$(id)}] [{text:"[TMF] ",color:"gold"},{selector:"@s",color:"white"},{text:" declined your teleport request.",color:"gray"}]
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Teleport request declined.",color:"gray"}]
