scoreboard players set #creeper_nogrief tmf.cfg 0
execute as @e[type=minecraft:creeper,tag=tmf.cng] run function tmf:creeper/restore
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Creeper No-Grief",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/griefing
