scoreboard players set @s tmf.leave 0
function tmf:locks/apply_self
function tmf:join/ensure_online
# AFK state does not survive a reconnect
execute if entity @s[tag=tmf.afk] run tag @s remove tmf.afk
execute if entity @s[team=tmf.afk] run team leave @s
scoreboard players set @s tmf.afk 0
execute unless score #join_leave tmf.cfg matches 1 run return 0
function tmf:join/welcome
