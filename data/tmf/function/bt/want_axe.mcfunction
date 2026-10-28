execute if items entity @s weapon.mainhand #minecraft:axes run return 1
execute if items entity @s container.* minecraft:netherite_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:netherite_axe"}
execute if items entity @s container.* minecraft:diamond_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:diamond_axe"}
execute if items entity @s container.* minecraft:iron_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:iron_axe"}
execute if items entity @s container.* minecraft:copper_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:copper_axe"}
execute if items entity @s container.* minecraft:stone_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:stone_axe"}
execute if items entity @s container.* minecraft:golden_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:golden_axe"}
execute if items entity @s container.* minecraft:wooden_axe[minecraft:damage~{durability:{min:3}}] run return run function tmf:bt/find {id:"minecraft:wooden_axe"}
return fail
