execute if score #invisible_frames tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_invisible_frames tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.invisible_frames] run return run function tmf:menu/p/invisible_frames_unset
tag @s add tmf.off.invisible_frames
function tmf:menu/open
