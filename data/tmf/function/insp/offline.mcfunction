data modify storage tmf:tmp ip.ago set value "unknown"
execute store result score #lt tmf.tmp run data get storage tmf:tmp ip.left
execute if score #lt tmf.tmp matches 0.. run function tmf:insp/ago
function tmf:insp/offline_text with storage tmf:tmp ip
