data modify storage tmf:tmp cp set value {i:"🧭",n:"Lodestone"}
execute if items entity @s weapon.mainhand minecraft:compass[minecraft:lodestone_tracker] run data modify storage tmf:tmp cp.t set from entity @s SelectedItem.components."minecraft:lodestone_tracker".target
execute unless data storage tmf:tmp cp.t run data modify storage tmf:tmp cp.t set from entity @s equipment.offhand.components."minecraft:lodestone_tracker".target
execute unless data storage tmf:tmp cp.t run return run title @s actionbar [{text:"🧭 ",color:"gold"},{text:"This compass lost its lodestone",color:"gray"}]
function tmf:compass/show
