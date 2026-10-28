scoreboard players operation @s tmf.slx = #cx tmf.sl
scoreboard players operation @s tmf.slz = #cz tmf.sl
scoreboard players operation #s0 tmf.sl = #seed0 tmf.cfg
scoreboard players operation #s1 tmf.sl = #seed1 tmf.cfg
scoreboard players operation #s2 tmf.sl = #seed2 tmf.cfg
scoreboard players operation #s3 tmf.sl = #seed3 tmf.cfg
function tmf:slime/hash
function tmf:slime/next
scoreboard players set @s tmf.slr 0
execute if score #out tmf.sl matches 0 run scoreboard players set @s tmf.slr 1
