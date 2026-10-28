# Run this once as an operator to become a TMF admin and open the admin panel.
tag @s add tmf.admin
tellraw @s [{text:"[TMF] ",color:"gold"},{text:"You are now a TMF admin. Open the panel any time with ",color:"gray"},{text:"/trigger tmf set 2",color:"yellow"},{text:" or from ",color:"gray"},{text:"/trigger tmf",color:"yellow"},{text:".",color:"gray"}]
function tmf:admin/open
