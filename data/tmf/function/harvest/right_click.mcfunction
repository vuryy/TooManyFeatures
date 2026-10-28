execute unless function tmf:harvest/is_mature run return 0
data modify storage tmf:tmp hv set value {seed:"minecraft:air",state:"minecraft:air"}
execute if block ~ ~ ~ minecraft:wheat run data modify storage tmf:tmp hv set value {seed:"minecraft:wheat_seeds",state:"minecraft:wheat[age=0]"}
execute if block ~ ~ ~ minecraft:carrots run data modify storage tmf:tmp hv set value {seed:"minecraft:carrot",state:"minecraft:carrots[age=0]"}
execute if block ~ ~ ~ minecraft:potatoes run data modify storage tmf:tmp hv set value {seed:"minecraft:potato",state:"minecraft:potatoes[age=0]"}
execute if block ~ ~ ~ minecraft:beetroots run data modify storage tmf:tmp hv set value {seed:"minecraft:beetroot_seeds",state:"minecraft:beetroots[age=0]"}
execute if block ~ ~ ~ minecraft:nether_wart run data modify storage tmf:tmp hv set value {seed:"minecraft:nether_wart",state:"minecraft:nether_wart[age=0]"}
execute if block ~ ~ ~ minecraft:cocoa[facing=north] run data modify storage tmf:tmp hv set value {seed:"minecraft:cocoa_beans",state:"minecraft:cocoa[age=0,facing=north]"}
execute if block ~ ~ ~ minecraft:cocoa[facing=south] run data modify storage tmf:tmp hv set value {seed:"minecraft:cocoa_beans",state:"minecraft:cocoa[age=0,facing=south]"}
execute if block ~ ~ ~ minecraft:cocoa[facing=east] run data modify storage tmf:tmp hv set value {seed:"minecraft:cocoa_beans",state:"minecraft:cocoa[age=0,facing=east]"}
execute if block ~ ~ ~ minecraft:cocoa[facing=west] run data modify storage tmf:tmp hv set value {seed:"minecraft:cocoa_beans",state:"minecraft:cocoa[age=0,facing=west]"}
loot spawn ~ ~0.25 ~ mine ~ ~ ~ mainhand
function tmf:harvest/replant with storage tmf:tmp hv
playsound minecraft:block.crop.break block @a ~ ~ ~ 1 1
particle minecraft:happy_villager ~ ~0.5 ~ 0.3 0.2 0.3 0 4
swing @s mainhand
