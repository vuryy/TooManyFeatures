scoreboard players set #biome_info tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Biome Change Info",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
