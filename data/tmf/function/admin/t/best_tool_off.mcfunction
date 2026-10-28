scoreboard players set #best_tool tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tool Auto-Swap",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mining
