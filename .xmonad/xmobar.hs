Config {
    font = "xft:Source\ Code\ Pro\ for\ Powerline-14,FontAwesome:size=15",
    additionalFonts   = [ "xft:FontAwesome:pixelsize=15:antialias=true:hinting=true" ],
    -- bgColor = "#000900",
    -- fgColor = "#009C00",
    bgColor = "#000000",
    fgColor = "#FFAF00",
    alpha = 150,
    border = TopB,
    borderWidth = 1,
    borderColor = "#FF6600",
    pickBroadest = True
    position = Top,
    textOffset = 16,
    lowerOnStart = False,
    commands = [
        Run Locks,
        --Run Weather "EGLL" ["-t","<tempC>C <skyCondition>","-L","0","-H","25","-n","#ffca28","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run Weather "EGLL" ["-t","<fn=1>\xf0c2</fn> <tempC>°<skyCondition> ","-L","10","-H","25","-n","#ffca28","-h","#FFB6B0","-l","#96CBFE"] 3600,
        Run MultiCpu ["-t","<fn=1>\xf0e4</fn><total0> <vbar0><total1> <vbar1><total2> <vbar2><total3> <vbar3>","-L","30","-H","60","-h","#FFB6B0","-l","#ffca28","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","<fn=1>\xf2db</fn> <usedratio>%","--High","80","--Low","10","--high","#FF6600","--low","#96CBFE","--normal","#ffca28"] 10,
        Run Swap ["-t","<fn=1>\xf019</fn> <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#ffca28","-n","#FFFFCC"] 10,
        Run Network "enp2s0f0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#ffca28","-n","#FFFFCC"] 10,
        Run Wireless "wlp3s0" [ "-t", "<fn=1>\xf1eb</fn> <fc=#ffca28><essid></fc> [<qualitybar>]","-L","0","-H","32","--normal","yellow","--high","#ffca28","--low","red"] 10,
        Run Date "<fn=1>\xf073</fn> <fc=#ffca28>%a %b %d %H:%M</fc>" "date" 10,
        -- Run BatteryP ["BAT0"] ["-t", "<icon=/home/mlopes/.xmonad/icons/battery.xbm/> <fc=#ffca28><acstatus> <watts>(<left>%/<timeleft>)</fc>", "-L", "10", "-H", "80", "-p", "3", "--", "-L", "-15", "-H", "-5", "-l", "red", "-m", "#ffca28", "-h", "orange", "-f", "/sys/class/power_supply/AC0/online"] 600,
		Run BatteryP
			["BAT0"]
            [ "-t", "<fc=#ffca28><acstatus></fc>"
            , "-L", "20"
            , "-H", "85"
            , "-l", "red"
            , "-n", "#b58900"
            , "-h", "orange"
            , "--" -- battery specific options
            , "-p", "green"
            -- discharging status
            , "-o"  , "<fn=1>\xf242</fn> <left>% <leftvbar> (<timeleft>)"
			, "-m", "#ffca28"
            -- AC "on" status
            , "-O"  , "<fn=1>\xf1e6</fn> <left>%"
            -- charged status
            , "-i"  , "<fn=1>\xf1e6</fn> <left>%"
            , "--off-icon-pattern", "<fn=1>\xf1e6</fn>"
            , "--on-icon-pattern", "<fn=1>\xf1e6</fn>"
            ] 10,
        Run Volume "default" "Master"
            [ "-t", "<status>", "--"
                                  , "--on", "<fc=#ffca28><fn=1>\xf028</fn> <volume>%</fc>"
                                  , "--onc", "#859900"
                                  , "--off", "<fc=orange><fn=1>\xf026</fn> MUTE</fc>"
                                  , "--offc", "#dc322f"
                                   ] 1,
       Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{%locks% %multicpu% %memory% %swap% %wlp3s0wi% %default:Master% %battery% %date% %EGLL%"
}
