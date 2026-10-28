tag @s add tmf.pp_self
execute on owner run scoreboard players operation @e[tag=tmf.pp_self,limit=1] tmf.oid = @s tmf.id
tag @s remove tmf.pp_self
execute unless score @s tmf.oid matches 1.. run return 0
execute if items entity @s armor.feet * run return run tag @s add tmf.pg
item replace entity @s armor.feet with minecraft:barrier[minecraft:enchantments={"tmf:pet_guard":1},minecraft:custom_data={tmf_pet_guard:1b}]
data modify entity @s drop_chances.feet set value 0.0f
tag @s add tmf.pg
