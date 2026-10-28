scoreboard players set #ghast_nogrief tmf.cfg 0
execute as @e[type=minecraft:fireball,tag=tmf.gng] run function tmf:ghast/restore
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Ghast No-Grief",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/griefing
