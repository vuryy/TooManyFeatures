scoreboard players set #spawn_checker tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Spawn-Proof Checker",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
