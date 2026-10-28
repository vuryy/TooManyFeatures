scoreboard players add #gc tmf.tmp 1
execute store result score #s tmf.tmp run data get storage tmf:tmp cg.cur.s
scoreboard players operation #gmin tmf.tmp < #s tmf.tmp
scoreboard players operation #gmax tmf.tmp > #s tmf.tmp
