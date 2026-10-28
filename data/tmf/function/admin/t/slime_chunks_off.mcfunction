scoreboard players set #slime_chunks tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Slime Chunk Checker",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
