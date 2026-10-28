data remove entity @s attack
execute if entity @s[tag=tmf.ov.ladder] on attacker run function tmf:ladder/break
execute if entity @s[tag=tmf.ov.harvest] on attacker run function tmf:harvest/left_click
execute if entity @s[tag=tmf.ov.bt] on attacker run function tmf:bt/swap_now
execute if entity @s[tag=tmf.ov.bt] run kill @s
