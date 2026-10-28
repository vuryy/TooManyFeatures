scoreboard players set #invisible_frames tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Invisible Item Frames",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/farming
