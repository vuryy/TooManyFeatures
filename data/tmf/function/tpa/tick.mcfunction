scoreboard players remove @s tmf.tpx 1
execute if score @s tmf.tpx matches 0 run scoreboard players reset @s tmf.tpt
execute if score @s tmf.tpx matches 0 run tellraw @s [{text:"[TMF] ",color:"gold"},{text:"Your teleport request expired.",color:"gray"}]
