scoreboard players set #pet_health tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pet Health",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
