scoreboard players set #sapling_replant tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Sapling Replant",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
