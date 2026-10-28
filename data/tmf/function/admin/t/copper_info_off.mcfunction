scoreboard players set #copper_info tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Copper Oxidation Info",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
