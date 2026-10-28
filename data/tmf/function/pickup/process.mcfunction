tag @s remove tmf.invdirty
data modify storage tmf:tmp pk set value {inv:[],new:{},list:[],gain:[],lines:[],pid:0}
data modify storage tmf:tmp pk.inv set from entity @s Inventory
execute store result storage tmf:tmp pk.pid int 1 run scoreboard players get @s tmf.id
execute if data storage tmf:tmp pk.inv[0] run function tmf:pickup/agg
function tmf:pickup/load_old with storage tmf:tmp pk
scoreboard players set #shown tmf.tmp 0
execute if data storage tmf:tmp pk.old if entity @s[gamemode=!creative,gamemode=!spectator] if data storage tmf:tmp pk.list[0] run function tmf:pickup/diff
function tmf:pickup/save with storage tmf:tmp pk
execute if score #shown tmf.tmp matches 1.. run function tmf:pickup/show
