scoreboard players set #magnet tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Item Magnet",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/inventory
