execute if items entity @s weapon.mainhand #minecraft:shovels run return 1
execute if items entity @s container.* minecraft:netherite_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:netherite_shovel"}
execute if items entity @s container.* minecraft:diamond_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:diamond_shovel"}
execute if items entity @s container.* minecraft:iron_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:iron_shovel"}
execute if items entity @s container.* minecraft:copper_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:copper_shovel"}
execute if items entity @s container.* minecraft:stone_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:stone_shovel"}
execute if items entity @s container.* minecraft:golden_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:golden_shovel"}
execute if items entity @s container.* minecraft:wooden_shovel[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:wooden_shovel"}
return fail
