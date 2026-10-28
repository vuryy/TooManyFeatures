execute if score #arrow_counter tmf.cfg matches 1 if entity @s[tag=!tmf.off.arrow_counter] if items entity @s weapon.* #tmf:launchers run return run function tmf:arrows/show
execute if score #lodestone_coords tmf.cfg matches 1 if entity @s[tag=!tmf.off.lodestone_coords] if items entity @s weapon.* minecraft:compass[minecraft:lodestone_tracker] run return run function tmf:compass/lodestone
execute if score #lodestone_coords tmf.cfg matches 1 if entity @s[tag=!tmf.off.lodestone_coords] if items entity @s weapon.* minecraft:recovery_compass run return run function tmf:compass/recovery
execute if score #slime_chunks tmf.cfg matches 1 if entity @s[tag=!tmf.off.slime_chunks] if items entity @s weapon.* minecraft:slime_ball run return run function tmf:slime/show
