execute if score #fast_paths tmf.cfg matches 1.. run return run function tmf:admin/t/fast_paths_off
scoreboard players set #fast_paths tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Faster Paths",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/movement
