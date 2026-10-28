execute if score #arrow_counter tmf.cfg matches 1.. run return run function tmf:admin/t/arrow_counter_off
scoreboard players set #arrow_counter tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Arrow Counter",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/combat
