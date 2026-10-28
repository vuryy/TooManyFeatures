function tmf:wp/args
scoreboard players operation #s tmf.tmp = #v tmf.tmp
scoreboard players remove #s tmf.tmp 4010
function tmf:wp/delete_m with storage tmf:tmp w2
execute if score @s tmf.ws = #s tmf.tmp run scoreboard players set @s tmf.ws 0
function tmf:wp/open
