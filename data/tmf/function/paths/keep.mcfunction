execute unless score #fast_paths tmf.cfg matches 1 run return fail
execute unless entity @s[tag=tmf.on.fast_paths] run return fail
execute if entity @s[gamemode=spectator] run return fail
execute if function tmf:paths/on_path run return 1
# keep the bonus while jumping
execute unless entity @s[predicate=tmf:on_ground] run return 1
return fail
