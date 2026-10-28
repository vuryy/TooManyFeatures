execute if score #animal_owners tmf.cfg matches 1.. run return run function tmf:admin/t/animal_owners_off
scoreboard players set #animal_owners tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Animal Owners",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
