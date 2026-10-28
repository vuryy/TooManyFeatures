execute if score #trader_alert tmf.cfg matches 0 run return run function tmf:menu/open
execute if score #lock_trader_alert tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.on.trader_alert] run return run function tmf:menu/p/trader_alert_unset
tag @s add tmf.on.trader_alert
function tmf:menu/open
