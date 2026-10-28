execute store result score #mg tmf.tmp run gamerule mob_griefing
execute if score #mg tmf.tmp matches 1 run gamerule mob_griefing false
execute if score #mg tmf.tmp matches 0 run gamerule mob_griefing true
function tmf:admin/cat/griefing
