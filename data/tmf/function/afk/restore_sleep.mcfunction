execute if score #sleep_cur tmf.cfg = #sleep_pct tmf.cfg run return 0
scoreboard players operation #sleep_cur tmf.cfg = #sleep_pct tmf.cfg
execute store result storage tmf:tmp sl.v int 1 run scoreboard players get #sleep_pct tmf.cfg
function tmf:afk/set_gamerule with storage tmf:tmp sl
