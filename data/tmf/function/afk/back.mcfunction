tag @s remove tmf.afk
execute if entity @s[team=tmf.afk] run team leave @s
tellraw @a [{text:"☀ ",color:"yellow"},{selector:"@s",color:"gray"},{text:" is no longer AFK",color:"gray",italic:true}]
