execute if score #pickup_notices tmf.cfg matches 1.. run return run function tmf:admin/t/pickup_notices_off
scoreboard players set #pickup_notices tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pickup Notices",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/inventory
