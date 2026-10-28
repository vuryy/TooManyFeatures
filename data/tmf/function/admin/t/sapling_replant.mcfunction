execute if score #sapling_replant tmf.cfg matches 1.. run return run function tmf:admin/t/sapling_replant_off
scoreboard players set #sapling_replant tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Sapling Replant",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
