data modify storage tmf:tmp cp set value {i:"💀",n:"Last death"}
execute unless data entity @s LastDeathLocation run return run title @s actionbar [{text:"💀 ",color:"gray"},{text:"You haven't died yet",color:"gray"}]
data modify storage tmf:tmp cp.t set from entity @s LastDeathLocation
function tmf:compass/show
