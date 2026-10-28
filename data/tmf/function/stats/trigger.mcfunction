scoreboard players operation #v tmf.tmp = @s tmf.stats
scoreboard players set @s tmf.stats 0
execute unless score #stats_card tmf.cfg matches 1 run return run tellraw @s {text:"The stats card is disabled on this server.",color:"red"}
execute if score #v tmf.tmp matches 2 run return run function tmf:stats/share
function tmf:stats/show
