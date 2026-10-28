execute store result score #age tmf.tmp run data get entity @s Age
execute if score #age tmf.tmp matches 2400.. run return 1
return fail
