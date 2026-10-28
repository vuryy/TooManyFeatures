scoreboard players set #zombie_doors tmf.cfg 0
execute as @e[type=#tmf:door_breakers,tag=tmf.zd] run function tmf:zombie/restore
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Zombie Door Breaking",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/griefing
