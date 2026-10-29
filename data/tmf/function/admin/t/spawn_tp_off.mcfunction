scoreboard players set #spawn_tp tmf.cfg 0
tag @a remove tmf.tpspawn
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Spawn Teleport",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/movement
