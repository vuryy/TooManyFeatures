scoreboard players set #shulker_preview tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Shulker Preview",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/inventory
