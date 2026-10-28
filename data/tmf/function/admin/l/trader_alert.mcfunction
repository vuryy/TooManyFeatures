execute if score #lock_trader_alert tmf.cfg matches 1 run return run function tmf:admin/l/trader_alert_off
scoreboard players set #lock_trader_alert tmf.cfg 1
tag @a add tmf.on.trader_alert
function tmf:admin/locks
