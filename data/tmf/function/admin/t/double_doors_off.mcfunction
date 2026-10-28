scoreboard players set #double_doors tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Double Doors",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
