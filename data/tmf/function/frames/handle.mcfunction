scoreboard players set #found tmf.tmp 1
# the shears were just put into an empty frame: give them back
execute if items entity @s contents minecraft:shears unless items entity @a[tag=tmf.hs_player,limit=1] weapon.mainhand minecraft:shears run return run function tmf:frames/took
# the frame already held an item and got rotated: undo the rotation
execute if items entity @s contents * run function tmf:frames/unrotate
function tmf:frames/toggle
