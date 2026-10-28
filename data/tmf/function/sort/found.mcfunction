data modify storage tmf:tmp sc set value {in:[],work:[],sorted:[],merged:[],first:[],second:[]}
execute if block ~ ~ ~ minecraft:barrel run return run function tmf:sort/single
execute if block ~ ~ ~ #tmf:chests[type=single] run return run function tmf:sort/single
execute if block ~ ~ ~ #tmf:chests[type=right,facing=north] run return run function tmf:sort/double {sx:-1,sz:0}
execute if block ~ ~ ~ #tmf:chests[type=left,facing=north] positioned ~1 ~ ~0 run return run function tmf:sort/double {sx:-1,sz:0}
execute if block ~ ~ ~ #tmf:chests[type=right,facing=east] run return run function tmf:sort/double {sx:0,sz:-1}
execute if block ~ ~ ~ #tmf:chests[type=left,facing=east] positioned ~0 ~ ~1 run return run function tmf:sort/double {sx:0,sz:-1}
execute if block ~ ~ ~ #tmf:chests[type=right,facing=south] run return run function tmf:sort/double {sx:1,sz:0}
execute if block ~ ~ ~ #tmf:chests[type=left,facing=south] positioned ~-1 ~ ~0 run return run function tmf:sort/double {sx:1,sz:0}
execute if block ~ ~ ~ #tmf:chests[type=right,facing=west] run return run function tmf:sort/double {sx:0,sz:1}
execute if block ~ ~ ~ #tmf:chests[type=left,facing=west] positioned ~0 ~ ~-1 run return run function tmf:sort/double {sx:0,sz:1}
