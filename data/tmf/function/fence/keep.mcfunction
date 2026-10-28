execute unless score #fence_jump tmf.cfg matches 1 run return fail
execute unless entity @s[tag=tmf.on.fence_jump] run return fail
execute unless entity @s[predicate=tmf:on_ground] run return 1
execute if function tmf:fence/facing run return 1
return fail
