execute if score #invisible_frames tmf.cfg matches 1.. run return run function tmf:admin/t/invisible_frames_off
scoreboard players set #invisible_frames tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Invisible Item Frames",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
