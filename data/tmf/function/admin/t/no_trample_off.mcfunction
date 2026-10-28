scoreboard players set #no_trample tmf.cfg 0
execute as @a[tag=tmf.ntsf] run function tmf:trample/landed
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Crop Trampling",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
