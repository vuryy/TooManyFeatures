scoreboard players set #n0 tmf.sl 0
scoreboard players operation #t tmf.sl = #r0 tmf.sl
scoreboard players operation #t tmf.sl *= #k1645 tmf.sl
scoreboard players operation #n0 tmf.sl += #t tmf.sl
scoreboard players set #n1 tmf.sl 0
scoreboard players operation #t tmf.sl = #r0 tmf.sl
scoreboard players operation #t tmf.sl *= #k3790 tmf.sl
scoreboard players operation #n1 tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r1 tmf.sl
scoreboard players operation #t tmf.sl *= #k1645 tmf.sl
scoreboard players operation #n1 tmf.sl += #t tmf.sl
scoreboard players set #n2 tmf.sl 0
scoreboard players operation #t tmf.sl = #r0 tmf.sl
scoreboard players operation #t tmf.sl *= #k1502 tmf.sl
scoreboard players operation #n2 tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r1 tmf.sl
scoreboard players operation #t tmf.sl *= #k3790 tmf.sl
scoreboard players operation #n2 tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r2 tmf.sl
scoreboard players operation #t tmf.sl *= #k1645 tmf.sl
scoreboard players operation #n2 tmf.sl += #t tmf.sl
scoreboard players set #n3 tmf.sl 0
scoreboard players operation #t tmf.sl = #r1 tmf.sl
scoreboard players operation #t tmf.sl *= #k1502 tmf.sl
scoreboard players operation #n3 tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r2 tmf.sl
scoreboard players operation #t tmf.sl *= #k3790 tmf.sl
scoreboard players operation #n3 tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r3 tmf.sl
scoreboard players operation #t tmf.sl *= #k1645 tmf.sl
scoreboard players operation #n3 tmf.sl += #t tmf.sl
scoreboard players operation #n0 tmf.sl += #k11 tmf.sl
scoreboard players operation #t tmf.sl = #n0 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #n1 tmf.sl += #t tmf.sl
scoreboard players operation #n0 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #n1 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #n2 tmf.sl += #t tmf.sl
scoreboard players operation #n1 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #t tmf.sl = #n2 tmf.sl
scoreboard players operation #t tmf.sl /= #k4096 tmf.sl
scoreboard players operation #n3 tmf.sl += #t tmf.sl
scoreboard players operation #n2 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #n3 tmf.sl %= #k4096 tmf.sl
scoreboard players operation #r0 tmf.sl = #n0 tmf.sl
scoreboard players operation #r1 tmf.sl = #n1 tmf.sl
scoreboard players operation #r2 tmf.sl = #n2 tmf.sl
scoreboard players operation #r3 tmf.sl = #n3 tmf.sl
scoreboard players operation #out tmf.sl = #r1 tmf.sl
scoreboard players operation #out tmf.sl /= #k32 tmf.sl
scoreboard players operation #t tmf.sl = #r2 tmf.sl
scoreboard players operation #t tmf.sl *= #k128 tmf.sl
scoreboard players operation #out tmf.sl += #t tmf.sl
scoreboard players operation #t tmf.sl = #r3 tmf.sl
scoreboard players operation #t tmf.sl *= #k524288 tmf.sl
scoreboard players operation #out tmf.sl += #t tmf.sl
scoreboard players operation #u tmf.sl = #out tmf.sl
scoreboard players operation #out tmf.sl %= #k10 tmf.sl
# Random.nextInt(10) rejects the top few values of next(31) and draws again
execute if score #u tmf.sl matches 2147483640.. run function tmf:slime/next
