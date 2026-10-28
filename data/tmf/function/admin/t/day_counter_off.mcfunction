scoreboard players set #day_counter tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Day Counter",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/movement
