scoreboard players set #fast_paths tmf.cfg 0
execute as @a[tag=tmf.onpath] run function tmf:paths/remove
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Faster Paths",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/movement
