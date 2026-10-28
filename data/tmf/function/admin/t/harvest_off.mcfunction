scoreboard players set #harvest tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Right-Click Harvest",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
