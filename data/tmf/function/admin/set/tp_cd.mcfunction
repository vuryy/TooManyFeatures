execute if score #tp_cd tmf.cfg matches 0 run return run function tmf:admin/set/tp_cd_to {v:5}
execute if score #tp_cd tmf.cfg matches 5 run return run function tmf:admin/set/tp_cd_to {v:10}
execute if score #tp_cd tmf.cfg matches 10 run return run function tmf:admin/set/tp_cd_to {v:30}
execute if score #tp_cd tmf.cfg matches 30 run return run function tmf:admin/set/tp_cd_to {v:60}
execute if score #tp_cd tmf.cfg matches 60 run return run function tmf:admin/set/tp_cd_to {v:120}
execute if score #tp_cd tmf.cfg matches 120 run return run function tmf:admin/set/tp_cd_to {v:300}
execute if score #tp_cd tmf.cfg matches 300 run return run function tmf:admin/set/tp_cd_to {v:0}
function tmf:admin/set/tp_cd_to {v:0}
