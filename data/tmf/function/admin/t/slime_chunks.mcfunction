execute if score #slime_chunks tmf.cfg matches 1.. run return run function tmf:admin/t/slime_chunks_off
scoreboard players set #slime_chunks tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Slime Chunk Checker",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
