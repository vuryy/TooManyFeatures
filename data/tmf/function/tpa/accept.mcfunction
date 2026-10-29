$function tmf:tpa/check {id:$(id)}
execute if score #ok tmf.tmp matches 0 run return run function tmf:tpa/expired
$execute store result score #mode tmf.tmp run scoreboard players get @a[scores={tmf.id=$(id)},limit=1] tmf.tpm
$scoreboard players set @a[scores={tmf.id=$(id)}] tmf.tpx 0
$scoreboard players reset @a[scores={tmf.id=$(id)}] tmf.tpt
# the cooldown applies to the player who sent the request
$scoreboard players operation @a[scores={tmf.id=$(id)}] tmf.tpc = #tp_cd tmf.cfg
$execute if score #mode tmf.tmp matches 1 run tp @a[scores={tmf.id=$(id)},limit=1] @s
$execute if score #mode tmf.tmp matches 2 run tp @s @a[scores={tmf.id=$(id)},limit=1]
execute at @s run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 0.8 1
$tellraw @a[scores={tmf.id=$(id)}] [{text:"[TMF] ",color:"gold"},{selector:"@s",color:"white"},{text:" accepted your teleport request.",color:"green"}]
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Teleport request accepted.",color:"green"}]
