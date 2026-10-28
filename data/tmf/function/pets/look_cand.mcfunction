execute if score #found tmf.tmp matches 1 run return 0
execute unless data entity @s Owner run return 0
tag @s add tmf.hs_cand
execute if entity @a[tag=tmf.hs_player,limit=1,predicate=tmf:looking_at_candidate] run function tmf:pets/look_show
tag @s remove tmf.hs_cand
