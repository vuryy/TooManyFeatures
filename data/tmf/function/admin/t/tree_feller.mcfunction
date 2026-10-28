execute if score #tree_feller tmf.cfg matches 1.. run return run function tmf:admin/t/tree_feller_off
scoreboard players set #tree_feller tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tree Feller",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
