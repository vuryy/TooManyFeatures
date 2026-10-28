scoreboard players operation #h tmf.tmp = @s tmf.s.play
scoreboard players operation #h tmf.tmp /= #72000 tmf.c
execute unless score @s tmf.ms matches 0.. run scoreboard players set @s tmf.ms 0
execute if score #h tmf.tmp matches 1000.. unless score @s tmf.ms matches 1000.. run return run function tmf:milestone/reach {h:1000}
execute if score #h tmf.tmp matches 500.. unless score @s tmf.ms matches 500.. run return run function tmf:milestone/reach {h:500}
execute if score #h tmf.tmp matches 250.. unless score @s tmf.ms matches 250.. run return run function tmf:milestone/reach {h:250}
execute if score #h tmf.tmp matches 100.. unless score @s tmf.ms matches 100.. run return run function tmf:milestone/reach {h:100}
execute if score #h tmf.tmp matches 50.. unless score @s tmf.ms matches 50.. run return run function tmf:milestone/reach {h:50}
execute if score #h tmf.tmp matches 25.. unless score @s tmf.ms matches 25.. run return run function tmf:milestone/reach {h:25}
execute if score #h tmf.tmp matches 10.. unless score @s tmf.ms matches 10.. run return run function tmf:milestone/reach {h:10}
execute if score #h tmf.tmp matches 5.. unless score @s tmf.ms matches 5.. run return run function tmf:milestone/reach {h:5}
execute if score #h tmf.tmp matches 1.. unless score @s tmf.ms matches 1.. run return run function tmf:milestone/reach {h:1}
