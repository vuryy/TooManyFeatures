scoreboard players set #stats_card tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Stats Card",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
