execute if score #damage_numbers tmf.cfg matches 1.. run return run function tmf:admin/t/damage_numbers_off
scoreboard players set #damage_numbers tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Damage Numbers",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/combat
