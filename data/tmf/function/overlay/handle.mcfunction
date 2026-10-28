data remove entity @s interaction
execute if entity @s[tag=tmf.ov.ladder] as @a[tag=tmf.clicker,limit=1] run function tmf:ladder/drop
execute if entity @s[tag=tmf.ov.harvest] as @a[tag=tmf.clicker,limit=1] run function tmf:harvest/right_click
# right-click on a Tool Auto-Swap overlay: get out of the way for 2 seconds
execute if entity @s[tag=tmf.ov.bt] as @a[tag=tmf.clicker,limit=1] run function tmf:bt/suppress
execute if entity @s[tag=tmf.ov.bt] run kill @s
