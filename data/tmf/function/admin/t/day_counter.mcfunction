execute if score #day_counter tmf.cfg matches 1.. run return run function tmf:admin/t/day_counter_off
scoreboard players set #day_counter tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Day Counter",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
