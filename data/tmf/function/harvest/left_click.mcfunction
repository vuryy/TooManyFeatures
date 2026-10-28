execute unless entity @s[gamemode=creative] run loot spawn ~ ~0.25 ~ mine ~ ~ ~ mainhand
setblock ~ ~ ~ minecraft:air
playsound minecraft:block.crop.break block @a ~ ~ ~ 1 1
