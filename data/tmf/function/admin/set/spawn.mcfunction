execute if data storage tmf:data spawn.dim run return run function tmf:admin/set/spawn_reset
data modify storage tmf:data spawn set value {}
data modify storage tmf:data spawn.x set from entity @s Pos[0]
data modify storage tmf:data spawn.y set from entity @s Pos[1]
data modify storage tmf:data spawn.z set from entity @s Pos[2]
data modify storage tmf:data spawn.yaw set from entity @s Rotation[0]
data modify storage tmf:data spawn.pitch set from entity @s Rotation[1]
data modify storage tmf:data spawn.dim set from entity @s Dimension
execute store result storage tmf:data spawn.bx int 1 run data get entity @s Pos[0]
execute store result storage tmf:data spawn.by int 1 run data get entity @s Pos[1]
execute store result storage tmf:data spawn.bz int 1 run data get entity @s Pos[2]
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Spawn Teleport now takes players to ",color:"gray"},{selector:"@s",color:"white"},{text:"'s position.",color:"gray"}]
function tmf:admin/open
