execute unless score @s tmf.tpx matches 1.. run return run tellraw @s [{text:"[TMF] ",color:"gold"},{text:"You have no open teleport request.",color:"gray"}]
scoreboard players set @s tmf.tpx 0
scoreboard players reset @s tmf.tpt
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Teleport request withdrawn.",color:"gray"}]
