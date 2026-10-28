execute if score #ladder_drop tmf.cfg matches 1.. run return run function tmf:admin/t/ladder_drop_off
scoreboard players set #ladder_drop tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Ladder Dropping",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
