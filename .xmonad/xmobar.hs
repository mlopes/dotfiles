-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Source\ Code\ Pro\ for\ Powerline-9",
    bgColor = "#000900",
    fgColor = "#009C00",
    pickBroadest = True
    position = Top
    lowerOnStart = False,
    commands = [
        -- Run Weather "EGLL" ["-t","<tempC>C <skyCondition>","-L","0","-H","25","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run Weather "EGRB" ["-t","<icon=/home/mlopes/.xmonad/icons/weather.xbm/> <tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 3600,
        Run MultiCpu ["-t","<icon=/home/mlopes/.xmonad/icons/cpu.xbm/><total0><total1><total2><total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","<icon=/home/mlopes/.xmonad/icons/mem.xbm/><usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","<usedratio>% swap","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "enp2s0f0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp1s0" [ "-t", "<icon=/home/mlopes/.xmonad/icons/net-wifi.xbm/> <fc=#CEFFAC><essid></fc> [<qualitybar>]","-L","0","-H","32","--normal","yellow","--high","#CEFFAC","--low","red"] 10,
        Run Date "<icon=/home/mlopes/.xmonad/icons/calendar.xbm/> <fc=#CEFFAC>%a %b %d %H:%M</fc>" "date" 10,
        Run BatteryP ["BAT0"] ["-t", "<icon=/home/mlopes/.xmonad/icons/battery.xbm/> <fc=#CEFFAC><acstatus> <watts>(<left>%/<timeleft>)</fc>", "-L", "10", "-H", "80", "-p", "3", "--", "-L", "-15", "-H", "-5", "-l", "red", "-m", "#CEFFAC", "-h", "orange", "-f", "/sys/class/power_supply/AC0/online"] 600,
        -- Run Com "/home/mlopes/.xmonad/bin/wifi.sh" [] "wifi" 30,
       Run Com "/home/mlopes/.xmonad/bin/volume.sh" [] "volume" 3,
       Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{%multicpu% %memory% %swap%  %wlp1s0wi% <icon=/home/mlopes/.xmonad/icons/vol-hi.xbm/><fc=#CEFFAC>%volume%</fc> %battery% %date% %EGRB%"
}
