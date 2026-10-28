$data modify storage tmf:tmp ip.st set value "○ Offline – last seen $(ago)\\nLast known position: $(x) $(y) $(z) in $(dn)"
$data modify storage tmf:tmp ip.tp set value "/execute in $(dim) run tp @s $(x) $(y) $(z)"
