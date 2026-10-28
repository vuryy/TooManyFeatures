scoreboard players set #entity_warning tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Entity Crowd Warning",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
