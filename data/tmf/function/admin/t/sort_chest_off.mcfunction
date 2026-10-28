scoreboard players set #sort_chest tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Sort Chest",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/inventory
