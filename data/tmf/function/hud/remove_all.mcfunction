# removes every TMF boss bar (ids 1 .. highest player id)
scoreboard players set #i tmf.tmp 0
function tmf:hud/remove_next
tag @a remove tmf.hudbar
