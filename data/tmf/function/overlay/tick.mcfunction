# left-clicks on overlays
execute as @e[type=minecraft:interaction,tag=tmf.ov] if data entity @s attack at @s run function tmf:overlay/on_attack
tag @e[type=minecraft:interaction,tag=tmf.ov] add tmf.ov_stale
execute if score #ladder_drop tmf.cfg matches 1 as @a[tag=!tmf.off.ladder_drop,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] if items entity @s weapon.mainhand minecraft:ladder at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"ladder"}
execute if score #harvest tmf.cfg matches 1 as @a[tag=!tmf.off.harvest,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] unless items entity @s weapon.mainhand minecraft:ladder at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"harvest"}
# Tool Auto-Swap: while mining, swap as soon as you look at a block that needs another tool (tunnelling)
execute if score #best_tool tmf.cfg matches 1 as @a[tag=tmf.on.best_tool,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] if score @s tmf.mine > #tick tmf.c unless score @s tmf.fight > #tick tmf.c if items entity @s weapon.mainhand #tmf:tools at @s anchored eyes positioned ^ ^ ^ run function tmf:bt/mine_ray_start
# ...and when not mining yet, catch the first left-click on such a block
execute if score #best_tool tmf.cfg matches 1 as @a[tag=tmf.on.best_tool,gamemode=!spectator,gamemode=!adventure,predicate=!tmf:sneaking] unless score @s tmf.mine > #tick tmf.c unless score @s tmf.fight > #tick tmf.c unless score @s tmf.btsup > #tick tmf.c if items entity @s weapon.mainhand #tmf:tools at @s anchored eyes positioned ^ ^ ^ run function tmf:overlay/ray_start {type:"bt"}
kill @e[type=minecraft:interaction,tag=tmf.ov_stale]
