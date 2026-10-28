scoreboard players set #crop_info tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Crop Growth Info",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
