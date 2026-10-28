execute if score #no_phantoms tmf.cfg matches 1.. run return run function tmf:admin/t/no_phantoms_off
scoreboard players set #no_phantoms tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Phantoms",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
