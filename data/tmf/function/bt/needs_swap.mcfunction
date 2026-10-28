function tmf:bt/category
execute if score #cat tmf.tmp matches 0 run return fail
execute if score #cat tmf.tmp matches 1 if items entity @s weapon.mainhand #minecraft:pickaxes run return fail
execute if score #cat tmf.tmp matches 2 if items entity @s weapon.mainhand #minecraft:axes run return fail
execute if score #cat tmf.tmp matches 3 if items entity @s weapon.mainhand #minecraft:shovels run return fail
execute if score #cat tmf.tmp matches 4 if items entity @s weapon.mainhand #minecraft:hoes run return fail
execute if score #cat tmf.tmp matches 5 if items entity @s weapon.mainhand minecraft:shears run return fail
# keep right-click tool uses working (tilling, scraping copper, putting out campfires)
execute if items entity @s weapon.mainhand #minecraft:hoes if block ~ ~ ~ #tmf:tillable run return fail
execute if items entity @s weapon.mainhand #minecraft:axes if block ~ ~ ~ #tmf:axe_usable run return fail
execute if items entity @s weapon.mainhand #minecraft:shovels if block ~ ~ ~ #minecraft:campfires run return fail
execute if score #cat tmf.tmp matches 1 if items entity @s container.* #minecraft:pickaxes[minecraft:damage~{durability:{min:3}}] run return 1
execute if score #cat tmf.tmp matches 2 if items entity @s container.* #minecraft:axes[minecraft:damage~{durability:{min:3}}] run return 1
execute if score #cat tmf.tmp matches 3 if items entity @s container.* #minecraft:shovels[minecraft:damage~{durability:{min:3}}] run return 1
execute if score #cat tmf.tmp matches 4 if items entity @s container.* #minecraft:hoes[minecraft:damage~{durability:{min:3}}] run return 1
execute if score #cat tmf.tmp matches 5 if items entity @s container.* minecraft:shears[minecraft:damage~{durability:{min:3}}] run return 1
return fail
