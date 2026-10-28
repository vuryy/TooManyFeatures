playsound minecraft:ui.button.click master @s ~ ~ ~ 0.4 1.2
data modify storage tmf:tmp lg set value {l:[]}
execute store result storage tmf:tmp lg.all int 1 if entity @e
execute store result storage tmf:tmp lg.pl int 1 if entity @a
execute store result storage tmf:tmp lg.it int 1 if entity @e[type=minecraft:item]
execute store result storage tmf:tmp lg.xp int 1 if entity @e[type=minecraft:experience_orb]
execute store result storage tmf:tmp lg.ar int 1 if entity @e[type=#minecraft:arrows]
execute store result storage tmf:tmp lg.ho int 1 if entity @e[type=#tmf:hostile]
execute store result storage tmf:tmp lg.an int 1 if entity @e[type=#tmf:breedable]
execute store result storage tmf:tmp lg.vi int 1 if entity @e[type=minecraft:villager]
execute store result storage tmf:tmp lg.de int 1 if entity @e[type=#tmf:decor]
execute store result storage tmf:tmp lg.ve int 1 if entity @e[type=#tmf:vehicles]
execute store result storage tmf:tmp lg.te int 1 if entity @e[type=#tmf:technical]
execute as @a at @s run function tmf:lag/near
function tmf:lag/show with storage tmf:tmp lg
