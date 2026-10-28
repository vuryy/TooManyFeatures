scoreboard players set #animal_owners tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Animal Owners",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
