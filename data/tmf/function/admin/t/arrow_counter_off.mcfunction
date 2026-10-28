scoreboard players set #arrow_counter tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Arrow Counter",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/combat
