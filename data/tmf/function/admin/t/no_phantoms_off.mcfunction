scoreboard players set #no_phantoms tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Phantoms",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
