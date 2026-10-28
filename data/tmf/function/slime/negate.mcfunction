scoreboard players operation #t tmf.sl = #p0 tmf.sl
scoreboard players set #p0 tmf.sl 4095
scoreboard players operation #p0 tmf.sl -= #t tmf.sl
scoreboard players operation #t tmf.sl = #p1 tmf.sl
scoreboard players set #p1 tmf.sl 4095
scoreboard players operation #p1 tmf.sl -= #t tmf.sl
scoreboard players operation #t tmf.sl = #p2 tmf.sl
scoreboard players set #p2 tmf.sl 4095
scoreboard players operation #p2 tmf.sl -= #t tmf.sl
scoreboard players operation #t tmf.sl = #p3 tmf.sl
scoreboard players set #p3 tmf.sl 4095
scoreboard players operation #p3 tmf.sl -= #t tmf.sl
scoreboard players operation #p0 tmf.sl += #k1 tmf.sl
scoreboard players operation #t tmf.sl = #p0 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p1 tmf.sl += #t tmf.sl
scoreboard players operation #p0 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #p1 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p2 tmf.sl += #t tmf.sl
scoreboard players operation #p1 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #p2 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #p3 tmf.sl += #t tmf.sl
scoreboard players operation #p2 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #p3 tmf.sl %= #k4096 tmf.sl
