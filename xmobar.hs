-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:NanumGothicCoding:size=11:antialias=true"
    bgColor = "#000000",
    fgColor = "#ffffff",
    -- position = Static { xpos = 0, ypos = 0, width = 1770, height = 25 },
    commands = [
        Run Weather "RKSM" ["-t","<station>: <tempC>C <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        -- Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        -- Run Network "wlan0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        -- cpu core temperature monitor
        Run CoreTemp       [ "--template" , "Temp: <core0> <core1> <core2> <core3> <core4>"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10,
        Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: kB/s
                             , "--High"     , "5000"       -- units: kB/s
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run BatteryP ["BAT0"] ["-t", "<acstatus><watts> (<left>%)", "-L", "10", "-H", "80", "-p", "3", "--", "-O", "<fc=green>On</fc> - ", "-i", "", "-L", "-15", "-H", "-5", "-l", "red", "-m", "blue", "-h", "green"] 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "<fc=#FFFFCC>%date%</fc> %multicpu% %coretemp% %memory% %dynnetwork% | %StdinReader%"
    -- template = "%StdinReader% }{ %multicpu% %coretemp%  %memory%  %dynnetwork%  <fc=#FFFFCC>%date%</fc>  %battery%           "
}
