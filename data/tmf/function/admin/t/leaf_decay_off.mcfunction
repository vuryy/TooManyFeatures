scoreboard players set #leaf_decay tmf.cfg 0
kill @e[type=minecraft:marker,tag=tmf.ld]
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Fast Leaf Decay",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mining
