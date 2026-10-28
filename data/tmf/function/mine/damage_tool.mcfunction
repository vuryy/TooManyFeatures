execute if entity @s[gamemode=creative] run return 1
execute if items entity @s weapon.mainhand *[minecraft:unbreakable] run return 1
execute unless items entity @s weapon.mainhand *[minecraft:damage~{durability:{min:2}}] run return fail
scoreboard players add #tdmg tmf.tmp 1
execute store result storage tmf:tmp td.d int 1 run scoreboard players get #tdmg tmf.tmp
function tmf:mine/set_damage with storage tmf:tmp td
return 1
