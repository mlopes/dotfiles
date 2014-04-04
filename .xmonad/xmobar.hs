-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Source\ Code\ Pro\ for\ Powerline-9",
    bgColor = "#000000",
    fgColor = "#009C00",
    position = Static { xpos = 0, ypos = 0, width = 1918, height = 16 },
    lowerOnStart = False,
    commands = [
        Run Weather "EGLL" ["-t","<tempC>C <skyCondition>","-L","0","-H","25","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "enp2s0f0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
 	Run BatteryP ["BAT0"] ["-t", "Bat:<acstatus><watts> (<left>%)", "-L", "10", "-H", "80", "-p", "3", "--", "-O", "<fc=green>On</fc> - ", "", "-L", "-15", "-H", "-5", "-l", "red", "-m", "blue", "-h", "green", "energy_full", " -f", "/sys/class/power_supply/AC0/online"] 600,
	Run Com "/home/mlopes/.xmonad/bin/wifi.sh" [] "wifi" 30,
	Run Com "/home/mlopes/.xmonad/bin/volume.sh" [] "volume" 2,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{%multicpu%  %memory%   %swap%  \\|/:<fc=#CEFFAC>%wifi%</fc> <)<fc=#CEFFAC>%volume%</fc>  %enp2s0f0% %battery%   <fc=#CEFFAC>%date%</fc>   %EGLL%"
}
