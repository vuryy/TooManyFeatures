execute if data storage tmf:tmp sc.in[0] run function tmf:sort/annotate
execute if data storage tmf:tmp sc.work[0] run function tmf:sort/extract
execute if data storage tmf:tmp sc.sorted[0] run function tmf:sort/merge
scoreboard players set #slot tmf.tmp 0
execute if data storage tmf:tmp sc.merged[0] run function tmf:sort/assign
