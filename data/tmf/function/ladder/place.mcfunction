execute unless block ~ ~ ~ #tmf:ladder_space run return run function tmf:ladder/blocked
execute if block ~ ~1 ~ minecraft:ladder[facing=north] run return run function tmf:ladder/set {f:"north"}
execute if block ~ ~1 ~ minecraft:ladder[facing=south] run return run function tmf:ladder/set {f:"south"}
execute if block ~ ~1 ~ minecraft:ladder[facing=east] run return run function tmf:ladder/set {f:"east"}
execute if block ~ ~1 ~ minecraft:ladder[facing=west] run return run function tmf:ladder/set {f:"west"}
