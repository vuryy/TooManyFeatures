scoreboard players set #ladder_drop tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Ladder Dropping",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
