tag @s add tmf.afk
execute if entity @s[team=] run team join tmf.afk @s
tellraw @a [{text:"💤 ",color:"gray"},{selector:"@s",color:"gray"},{text:" is now AFK",color:"gray",italic:true}]
