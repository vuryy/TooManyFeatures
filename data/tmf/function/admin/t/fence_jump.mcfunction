execute if score #fence_jump tmf.cfg matches 1.. run return run function tmf:admin/t/fence_jump_off
scoreboard players set #fence_jump tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Fence Jumping",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/movement
