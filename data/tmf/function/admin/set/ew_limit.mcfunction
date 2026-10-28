execute if score #ew_limit tmf.cfg matches 100 run return run function tmf:admin/set/ew_limit_to {v:150}
execute if score #ew_limit tmf.cfg matches 150 run return run function tmf:admin/set/ew_limit_to {v:200}
execute if score #ew_limit tmf.cfg matches 200 run return run function tmf:admin/set/ew_limit_to {v:300}
execute if score #ew_limit tmf.cfg matches 300 run return run function tmf:admin/set/ew_limit_to {v:500}
execute if score #ew_limit tmf.cfg matches 500 run return run function tmf:admin/set/ew_limit_to {v:100}
function tmf:admin/set/ew_limit_to {v:100}
