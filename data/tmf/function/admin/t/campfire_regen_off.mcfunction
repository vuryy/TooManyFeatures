scoreboard players set #campfire_regen tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Campfire Regen",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/combat
