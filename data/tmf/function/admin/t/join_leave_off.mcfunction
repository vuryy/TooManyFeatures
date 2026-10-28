scoreboard players set #join_leave tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Join & Leave Messages",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
