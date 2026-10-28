# make the found door match the new state (in case the ray hit the partner first)
function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=north,hinge=left] positioned ~1 ~ ~ if block ~ ~ ~ #tmf:doors[facing=north,hinge=right,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=east,hinge=left] positioned ~ ~ ~1 if block ~ ~ ~ #tmf:doors[facing=east,hinge=right,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=south,hinge=left] positioned ~-1 ~ ~ if block ~ ~ ~ #tmf:doors[facing=south,hinge=right,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=west,hinge=left] positioned ~ ~ ~-1 if block ~ ~ ~ #tmf:doors[facing=west,hinge=right,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=north,hinge=right] positioned ~-1 ~ ~ if block ~ ~ ~ #tmf:doors[facing=north,hinge=left,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=east,hinge=right] positioned ~ ~ ~-1 if block ~ ~ ~ #tmf:doors[facing=east,hinge=left,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=south,hinge=right] positioned ~1 ~ ~ if block ~ ~ ~ #tmf:doors[facing=south,hinge=left,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
execute if block ~ ~ ~ #tmf:doors[facing=west,hinge=right] positioned ~ ~ ~1 if block ~ ~ ~ #tmf:doors[facing=west,hinge=left,half=lower] run return run function tmf:doors/set_here with storage tmf:tmp door
