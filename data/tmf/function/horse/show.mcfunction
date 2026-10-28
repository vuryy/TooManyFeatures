scoreboard players set #found tmf.tmp 1
# speed in blocks/s x10  (movement_speed * 42.16)
execute store result score #spd tmf.tmp run attribute @s minecraft:movement_speed base get 1000
scoreboard players operation #spdp tmf.tmp = #spd tmf.tmp
scoreboard players operation #spd tmf.tmp *= #4216 tmf.c
scoreboard players operation #spd tmf.tmp /= #10000 tmf.c
scoreboard players operation #spdi tmf.tmp = #spd tmf.tmp
scoreboard players operation #spdi tmf.tmp /= #10 tmf.c
scoreboard players operation #spdd tmf.tmp = #spd tmf.tmp
scoreboard players operation #spdd tmf.tmp %= #10 tmf.c
# speed percentage of the possible range (0.1125 .. 0.3375)
scoreboard players remove #spdp tmf.tmp 112
scoreboard players operation #spdp tmf.tmp *= #100 tmf.c
scoreboard players set #div tmf.tmp 225
scoreboard players operation #spdp tmf.tmp /= #div tmf.tmp
execute if score #spdp tmf.tmp matches ..-1 run scoreboard players set #spdp tmf.tmp 0
execute if score #spdp tmf.tmp matches 101.. run scoreboard players set #spdp tmf.tmp 100

# jump height (blocks x10) from jump_strength
execute store result score #x tmf.tmp run attribute @s minecraft:jump_strength base get 1000
scoreboard players operation #jp tmf.tmp = #x tmf.tmp
scoreboard players operation #x2 tmf.tmp = #x tmf.tmp
scoreboard players operation #x2 tmf.tmp *= #x tmf.tmp
scoreboard players operation #x2 tmf.tmp /= #1000 tmf.c
scoreboard players operation #x3 tmf.tmp = #x2 tmf.tmp
scoreboard players operation #x3 tmf.tmp *= #x tmf.tmp
scoreboard players operation #x3 tmf.tmp /= #1000 tmf.c
scoreboard players set #k tmf.tmp -1818
scoreboard players operation #x3 tmf.tmp *= #k tmf.tmp
scoreboard players set #k tmf.tmp 36897
scoreboard players operation #x2 tmf.tmp *= #k tmf.tmp
scoreboard players set #k tmf.tmp 21286
scoreboard players operation #x tmf.tmp *= #k tmf.tmp
scoreboard players operation #jmp tmf.tmp = #x3 tmf.tmp
scoreboard players operation #jmp tmf.tmp += #x2 tmf.tmp
scoreboard players operation #jmp tmf.tmp += #x tmf.tmp
scoreboard players remove #jmp tmf.tmp 3439304
scoreboard players set #k tmf.tmp 1000000
scoreboard players operation #jmp tmf.tmp /= #k tmf.tmp
execute if score #jmp tmf.tmp matches ..-1 run scoreboard players set #jmp tmf.tmp 0
scoreboard players operation #jmpi tmf.tmp = #jmp tmf.tmp
scoreboard players operation #jmpi tmf.tmp /= #10 tmf.c
scoreboard players operation #jmpd tmf.tmp = #jmp tmf.tmp
scoreboard players operation #jmpd tmf.tmp %= #10 tmf.c
# jump percentage of the possible range (0.4 .. 1.0)
scoreboard players remove #jp tmf.tmp 400
scoreboard players operation #jp tmf.tmp *= #100 tmf.c
scoreboard players set #div tmf.tmp 600
scoreboard players operation #jp tmf.tmp /= #div tmf.tmp
execute if score #jp tmf.tmp matches ..-1 run scoreboard players set #jp tmf.tmp 0
execute if score #jp tmf.tmp matches 101.. run scoreboard players set #jp tmf.tmp 100

# health
execute store result score #hp tmf.tmp run data get entity @s Health
execute store result score #mhp tmf.tmp run attribute @s minecraft:max_health get
scoreboard players operation #hpp tmf.tmp = #mhp tmf.tmp
scoreboard players remove #hpp tmf.tmp 15
scoreboard players operation #hpp tmf.tmp *= #100 tmf.c
scoreboard players set #div tmf.tmp 15
scoreboard players operation #hpp tmf.tmp /= #div tmf.tmp
execute if score #hpp tmf.tmp matches ..-1 run scoreboard players set #hpp tmf.tmp 0
execute if score #hpp tmf.tmp matches 101.. run scoreboard players set #hpp tmf.tmp 100

tellraw @a[tag=tmf.hs_player] [{text:"🐴 ",color:"gold"},{selector:"@s",color:"gold",bold:true},{text:" stats",color:"gold"}]
tellraw @a[tag=tmf.hs_player] [{text:"  Speed: ",color:"gray"},{score:{name:"#spdi",objective:"tmf.tmp"},color:"white"},{text:".",color:"white"},{score:{name:"#spdd",objective:"tmf.tmp"},color:"white"},{text:" blocks/s ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#spdp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
tellraw @a[tag=tmf.hs_player] [{text:"  Jump: ",color:"gray"},{score:{name:"#jmpi",objective:"tmf.tmp"},color:"white"},{text:".",color:"white"},{score:{name:"#jmpd",objective:"tmf.tmp"},color:"white"},{text:" blocks ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#jp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
tellraw @a[tag=tmf.hs_player] [{text:"  Health: ",color:"gray"},{score:{name:"#hp",objective:"tmf.tmp"},color:"white"},{text:"/",color:"white"},{score:{name:"#mhp",objective:"tmf.tmp"},color:"white"},{text:" HP ",color:"white"},{text:"(",color:"dark_gray"},{score:{name:"#hpp",objective:"tmf.tmp"},color:"aqua"},{text:"% of max)",color:"dark_gray"}]
execute on owner run tellraw @a[tag=tmf.hs_player] [{text:"  Owner: ",color:"gray"},{selector:"@s",color:"white"}]
