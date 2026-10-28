scoreboard players set #armor_warning tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Armor Warning",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mining
