scoreboard players set #waypoints tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Waypoints",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
