$scoreboard players set #sleep_pct tmf.cfg $(v)
scoreboard players set #sleep_cur tmf.cfg -1
execute if score #afk tmf.cfg matches 0 run function tmf:afk/restore_sleep
execute if score #afk tmf.cfg matches 1 run function tmf:afk/update_sleep
function tmf:admin/open
