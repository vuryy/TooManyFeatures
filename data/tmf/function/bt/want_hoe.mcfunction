execute if items entity @s weapon.mainhand #minecraft:hoes run return 1
execute if items entity @s container.* minecraft:netherite_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:netherite_hoe"}
execute if items entity @s container.* minecraft:diamond_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:diamond_hoe"}
execute if items entity @s container.* minecraft:iron_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:iron_hoe"}
execute if items entity @s container.* minecraft:copper_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:copper_hoe"}
execute if items entity @s container.* minecraft:stone_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:stone_hoe"}
execute if items entity @s container.* minecraft:golden_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:golden_hoe"}
execute if items entity @s container.* minecraft:wooden_hoe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:wooden_hoe"}
return fail
