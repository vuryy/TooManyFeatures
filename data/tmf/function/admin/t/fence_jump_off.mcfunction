scoreboard players set #fence_jump tmf.cfg 0
execute as @a[tag=tmf.fj] run function tmf:fence/remove
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Fence Jumping",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/movement
