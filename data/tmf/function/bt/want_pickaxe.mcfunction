execute if items entity @s weapon.mainhand #minecraft:pickaxes run return 1
execute if items entity @s container.* minecraft:netherite_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:netherite_pickaxe"}
execute if items entity @s container.* minecraft:diamond_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:diamond_pickaxe"}
execute if items entity @s container.* minecraft:iron_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:iron_pickaxe"}
execute if items entity @s container.* minecraft:copper_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:copper_pickaxe"}
execute if items entity @s container.* minecraft:stone_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:stone_pickaxe"}
execute if items entity @s container.* minecraft:golden_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:golden_pickaxe"}
execute if items entity @s container.* minecraft:wooden_pickaxe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:wooden_pickaxe"}
return fail
