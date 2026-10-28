scoreboard players set #tree_feller tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tree Feller",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mining
