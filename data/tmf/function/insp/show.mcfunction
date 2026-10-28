scoreboard players operation #iid tmf.tmp = #v tmf.tmp
scoreboard players remove #iid tmf.tmp 100000
data modify storage tmf:tmp ip set value {name:"?",st:"",tp:"",left:-1}
execute store result storage tmf:tmp ip.id int 1 run scoreboard players get #iid tmf.tmp
execute store result storage tmf:tmp ip.code int 1 run scoreboard players get #v tmf.tmp
function tmf:insp/load with storage tmf:tmp ip
execute if data storage tmf:tmp ip{name:"?"} run return run function tmf:insp/list
function tmf:insp/scores with storage tmf:tmp ip
scoreboard players set #on tmf.tmp 0
function tmf:insp/online_m with storage tmf:tmp ip
execute if score #on tmf.tmp matches 0 run function tmf:insp/offline
function tmf:insp/dialog with storage tmf:tmp ip
