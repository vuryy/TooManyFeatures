scoreboard players set #tool_swap tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tool Protector",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mining
