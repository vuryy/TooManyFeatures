$execute unless data storage tmf:data wp[{id:$(id)}] run data modify storage tmf:data wp append value {id:$(id)}
$data modify storage tmf:data wp[{id:$(id)}].s$(slot) set value {l:$(l),x:$(x),y:$(y),z:$(z),d:$(d)}
