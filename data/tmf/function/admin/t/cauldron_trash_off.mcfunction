scoreboard players set #cauldron_trash tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Cauldron Trash",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
