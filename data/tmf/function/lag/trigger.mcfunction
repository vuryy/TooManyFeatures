execute if score #v tmf.tmp matches 5000 run return run function tmf:lag/open
scoreboard players set #n tmf.tmp 0
execute if score #v tmf.tmp matches 5001 as @e[type=minecraft:item,tag=!tmf.dg] if function tmf:lag/old_item run tag @s add tmf.lagk
execute if score #v tmf.tmp matches 5002 run tag @e[type=minecraft:experience_orb] add tmf.lagk
execute if score #v tmf.tmp matches 5003 as @e[type=#minecraft:arrows] if data entity @s {inGround:1b} run tag @s add tmf.lagk
execute if score #v tmf.tmp matches 5004 as @e[type=#tmf:hostile] unless data entity @s {PersistenceRequired:1b} unless data entity @s CustomName run tag @s add tmf.lagk
execute store result score #n tmf.tmp if entity @e[tag=tmf.lagk]
execute if score #v tmf.tmp matches 5004 as @e[tag=tmf.lagk] at @s run tp @s ~ -1000 ~
execute unless score #v tmf.tmp matches 5004 run kill @e[tag=tmf.lagk]
tag @e[tag=tmf.lagk] remove tmf.lagk
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{selector:"@s",color:"white"},{text:" removed ",color:"gray"},{score:{name:"#n",objective:"tmf.tmp"},color:"white"},{text:" entities with the lag helper.",color:"gray"}]
function tmf:lag/open
