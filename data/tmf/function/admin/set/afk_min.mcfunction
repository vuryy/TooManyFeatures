execute if score #afk_min tmf.cfg matches 2 run return run function tmf:admin/set/afk_min_to {v:3}
execute if score #afk_min tmf.cfg matches 3 run return run function tmf:admin/set/afk_min_to {v:5}
execute if score #afk_min tmf.cfg matches 5 run return run function tmf:admin/set/afk_min_to {v:10}
execute if score #afk_min tmf.cfg matches 10 run return run function tmf:admin/set/afk_min_to {v:15}
execute if score #afk_min tmf.cfg matches 15 run return run function tmf:admin/set/afk_min_to {v:30}
execute if score #afk_min tmf.cfg matches 30 run return run function tmf:admin/set/afk_min_to {v:2}
function tmf:admin/set/afk_min_to {v:2}
