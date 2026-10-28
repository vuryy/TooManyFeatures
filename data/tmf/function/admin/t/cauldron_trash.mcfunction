execute if score #cauldron_trash tmf.cfg matches 1.. run return run function tmf:admin/t/cauldron_trash_off
scoreboard players set #cauldron_trash tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Cauldron Trash",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
