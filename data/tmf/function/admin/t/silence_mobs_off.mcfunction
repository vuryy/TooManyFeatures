scoreboard players set #silence_mobs tmf.cfg 0
function tmf:silence/off_all
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Silence Mobs",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
