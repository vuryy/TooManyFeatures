execute if score #leaf_decay tmf.cfg matches 1.. run return run function tmf:admin/t/leaf_decay_off
scoreboard players set #leaf_decay tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Fast Leaf Decay",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
