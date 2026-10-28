execute store result score #online tmf.tmp if entity @a
tellraw @s [{text:"👋 Welcome, ",color:"yellow"},{selector:"@s",color:"gold"},{text:"! ",color:"yellow"},{score:{name:"#online",objective:"tmf.tmp"},color:"white"},{text:" player(s) online right now.",color:"gray"}]
tellraw @s [{text:"   TMF features are active. ",color:"gray"},{text:"[Open settings]",color:"aqua",click_event:{action:"run_command",command:"/trigger tmf"},hover_event:{action:"show_text",value:"/trigger tmf"}}]
