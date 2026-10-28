scoreboard players set #tdmg tmf.tmp 0
execute store result score #tdmg tmf.tmp run data get entity @s SelectedItem.components."minecraft:damage"
execute store success score #silk tmf.tmp if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:silk_touch"}]]
