execute if score #no_phantoms tmf.cfg matches 1 run gamerule spawn_phantoms false
execute if score #no_phantoms tmf.cfg matches 0 if score #phantoms_orig tmf.cfg matches 1 run gamerule spawn_phantoms true
execute if score #afk tmf.cfg matches 0 run function tmf:afk/restore_sleep
