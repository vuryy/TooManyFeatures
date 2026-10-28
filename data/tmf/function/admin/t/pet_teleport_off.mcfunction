scoreboard players set #pet_teleport tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pet Teleport",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
