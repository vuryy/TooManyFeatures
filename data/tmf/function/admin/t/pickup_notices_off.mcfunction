scoreboard players set #pickup_notices tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pickup Notices",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/inventory
