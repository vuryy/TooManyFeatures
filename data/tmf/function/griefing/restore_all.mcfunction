execute as @e[type=minecraft:creeper,tag=tmf.cng] run function tmf:creeper/restore
execute as @e[type=minecraft:fireball,tag=tmf.gng] run function tmf:ghast/restore
execute as @e[type=#tmf:door_breakers,tag=tmf.zd] run function tmf:zombie/restore
kill @e[type=minecraft:item_display,tag=tmf.bl]
