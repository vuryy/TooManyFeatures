scoreboard players set #campfire_info tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Campfire Timer",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
