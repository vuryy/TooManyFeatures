scoreboard players operation #lo tmf.sl = #p0 tmf.sl
scoreboard players operation #t tmf.sl = #p1 tmf.sl
scoreboard players operation #t tmf.sl *= #k4096 tmf.sl
scoreboard players operation #lo tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #p2 tmf.sl
scoreboard players operation #t tmf.sl %= #k256 tmf.sl
scoreboard players operation #t tmf.sl *= #k16777216 tmf.sl
scoreboard players operation #lo tmf.sl += #t tmf.sl
