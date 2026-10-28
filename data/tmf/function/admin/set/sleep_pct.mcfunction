execute if score #sleep_pct tmf.cfg matches 0 run return run function tmf:admin/set/sleep_pct_to {v:25}
execute if score #sleep_pct tmf.cfg matches 25 run return run function tmf:admin/set/sleep_pct_to {v:50}
execute if score #sleep_pct tmf.cfg matches 50 run return run function tmf:admin/set/sleep_pct_to {v:75}
execute if score #sleep_pct tmf.cfg matches 75 run return run function tmf:admin/set/sleep_pct_to {v:100}
execute if score #sleep_pct tmf.cfg matches 100 run return run function tmf:admin/set/sleep_pct_to {v:0}
function tmf:admin/set/sleep_pct_to {v:0}
