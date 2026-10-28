data modify storage tmf:tmp sc.cur.r set value 99999
data modify storage tmf:tmp sc.cur.m set value 64
$data modify storage tmf:tmp sc.cur.r set from storage tmf:data rank."$(id)".r
$data modify storage tmf:tmp sc.cur.m set from storage tmf:data rank."$(id)".m
