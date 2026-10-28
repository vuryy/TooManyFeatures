execute unless dimension minecraft:overworld run return run title @s actionbar [{text:"🟢 ",color:"green"},{text:"Slime chunks only exist in the Overworld",color:"gray"}]
execute unless score #seed_set tmf.cfg matches 1 run return run title @s actionbar [{text:"🟢 ",color:"green"},{text:"Slime chunk checker is not set up yet – an admin has to enter the world seed",color:"gray"}]
execute store result score #cx tmf.sl run data get entity @s Pos[0] 0.0625
execute store result score #cz tmf.sl run data get entity @s Pos[2] 0.0625
execute unless score @s tmf.slx = #cx tmf.sl run function tmf:slime/compute
execute unless score @s tmf.slz = #cz tmf.sl run function tmf:slime/compute
execute if score @s tmf.slr matches 1 run return run title @s actionbar [{text:"🟢 ",color:"green"},{text:"Slime chunk!",color:"green",bold:true},{text:"  slimes spawn here below Y 40",color:"gray"}]
title @s actionbar [{text:"⬛ ",color:"dark_gray"},{text:"Not a slime chunk",color:"gray"}]
