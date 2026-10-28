execute if items entity @s weapon.mainhand minecraft:shears run return 1
execute if items entity @s container.* minecraft:shears[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:shears"}
return fail
