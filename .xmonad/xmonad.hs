-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (ToggleStruts(..),avoidStruts,docks,manageDocks)
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ScreenCorners
-- import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Decoration
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe,safeSpawn)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Themes
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Config.Desktop
import System.Environment (getEnvironment)

import XMonad.Prompt
import XMonad.Prompt.Window

import qualified XMonad.Actions.GridSelect as G

import XMonad.Hooks.EwmhDesktops

import XMonad.Actions.CycleWS

import XMonad.Layout.Spacing
-- import XMonad.Hooks.ICCCMFocus
import qualified XMonad.Util.Dzen as Dzen

import XMonad.Util.Run (runProcessWithInput)

import Data.List (isInfixOf)

import XMonad.Actions.ShowText
------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
-- myTerminal = "urxvt -e fish -c \"tmux -q has-session; and exec tmux attach-session -d; or exec tmux new-session -n$USER -s$USER@$HOSTNAME\""
-- myTerminal = "/usr/bin/urxvt +ls -e fish -l"
-- myTerminal = "/usr/bin/urxvt +ls -e fish -l"
-- myTerminal = "st -f \"DejaVu Sans Mono:size=10:antialias=true:hinting=true\" -e fish -l -c 'tmuxinator terminal'"
myTerminal = "kitty --title 'Terminal'"


------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces = ["1:dev","2:ide","3:web","4:comms","5:term", "6:apps"] ++ map show [7..9]



------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ resource  =? "termvim"                --> doShift "1:dev"
    , resource  =? "termtelegram"           --> doShift "4:comms"
    , resource  =? "cmusterm"               --> doShift "9"
    , className =? "Sublime_text"           --> doShift "2:ide"
    , className =? "Gvim"                   --> doShift "2:ide"
    , className =? "jetbrains-pycharm"      --> doShift "2:ide"
    , className =? "jetbrains-idea-ce"      --> doShift "2:ide"
    , className =? "jetbrains-phpstorm"     --> doShift "2:ide"
    , className =? "Emacs24"                --> doShift "2:ide"
    , className =? "Chromium"               --> doShift "3:web"
    , className =? "Google-chrome"          --> doShift "3:web"
    , className =? "chromium-browser"       --> doShift "3:web"
    , className =? "Chromium-browser"       --> doShift "3:web"
    , className =? "tabbed"                 --> doShift "3:web"
    , className =? "vimb"                   --> doShift "3:web"
    , className =? "Vimb"                   --> doShift "3:web"
    , className =? "Firefox"                --> doShift "3:web"
    , className =? "Xchat"                  --> doShift "4:comms"
    , className =? "HipChat"                --> doShift "4:comms"
    , className =? "Slack"                  --> doShift "4:comms"
    , className =? "Skype"                  --> doShift "4:comms"
    , className =? "TelegramDesktop"        --> doShift "4:comms"
    , className =? "Whatsie"                --> doShift "4:comms"
    , className =? "walc"                   --> doShift "4:comms"
    , className =? "URxvt"                  --> doShift "5:term"
    , className =? "st-256color"            --> doShift "5:term"
    , className =? "kitty"                  --> doShift "5:term"
    , className =? "Gnome-terminal"         --> doShift "5:term"
    , className =? "zoom"                   --> doShift "6:apps"
    , className =? "VirtualBox"             --> doShift "6:apps"
    , className =? "Gimp"                   --> doShift "6:apps"
    , className =? "DBeaver"                --> doShift "6:apps"
    , className =? "Pavucontrol"            --> doShift "7"
    , resource  =? "desktop_window"         --> doIgnore
    , className =? "Galculator"             --> doFloat
    , className =? "Steam"                  --> doFloat
    , className =? "Gimp"                   --> doFloat
    , resource  =? "gpicview"               --> doFloat
    , className =? "MPlayer"                --> doFloat
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
mySpacing bs = spacingRaw True (uniformBorder bs) True (uniformBorder bs) True
  where
    uniformBorder n = Border n n n n

myLayout = avoidStruts (
    (mySpacing 3 $ Tall 1 (3/100) (1/2)) |||
    (mySpacing 3 $ Mirror (Tall 1 (3/100) (1/2))) |||
    --tabbed shrinkText (theme kavonAutumnTheme) |||
    tabbed shrinkText tabConfig |||
    Full) -- |||
    -- spiral (6/7)) |||
    -- noBorders (fullscreenFull Full)


------------------------------------------------------------------------
-- Colors and borders
--
myNormalBorderColor  = "#121212"
myFocusedBorderColor = "#E75700"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = def {
    activeBorderColor = "#E75700",
    activeTextColor = "#FFCA28",
    activeColor = "#330000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000",
    fontName = "xft:terminus:size=6"
}
-- Color of current window title in xmobar.
xmobarTitleColor = "#EAAA31"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#FF6600"
-- Width of the window border in pixels.
myBorderWidth = 2


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

terminus = "-*-terminus-*-*-*-*-24-*-*-*-*-*-*-*"

externalCommandInPopUp :: String -> [String] -> X ()
externalCommandInPopUp c p = do
    s <- runProcessWithInput c p ""
    Dzen.dzenConfig (Dzen.onCurr (Dzen.center 800 30) Dzen.>=> Dzen.font terminus) s

gsconfig2 colorizer = (G.buildDefaultGSConfig colorizer) { G.gs_cellheight = 100, G.gs_cellwidth = 200 }

-- | A orangemonochrome colorizer based on window class
orangeColorizer = G.colorRangeFromClassName
                     black            -- lowest inactive bg
                     (0xFF,0x66,0x00) -- highest inactive bg
                     black            -- active bg
                     white            -- inactive fg
                     white            -- active fg
  where black = minBound
        white = maxBound

myXPConfig :: XPConfig
myXPConfig = amberXPConfig {
                            font="xft:DejaVu Sans Mono for Powerline:size=10"
                            ,height=50
                            ,searchPredicate = isInfixOf -- TODO: fuzzy matching
                           }

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  , ((modMask .|. mod1Mask, xK_Return),
     -- spawn "/usr/bin/urxvt +ls -depth 32 -bg rgba:0000/0000/0000/9999 -name termvim -e fish -l -c 'tmux attach'")
     -- spawn "st -f \"DejaVu Sans Mono:size=10:antialias=true:hinting=true\" -n termvim -e fish -l -c 'tmuxinator dev'")
     spawn "kitty --name termvim --title 'Dev Terminal'")

  , ((modMask .|. shiftMask, xK_m),
    (externalCommandInPopUp "mpc" ["current"]))

  , ((modMask .|. shiftMask, xK_s),
    (externalCommandInPopUp "connected_screens" []))

  -- Lock the screen using slock.
  , ((modMask .|. controlMask, xK_l),
     spawn "slock")

  -- Launch rofi
  -- Use this to launch programs without a key binding.
  , ((modMask, xK_p), spawn "rofi -show drun")
  --, ((modMask, xK_p), spawn "exe=`~/.xmonad/bin/dmenu_path | yeganesh` && eval \"exec $exe\"")

  -- Launch rofi in run mode
  -- Use this to launch programs without a key binding.
  , ((modMask .|. shiftMask, xK_p), spawn "rofi -show run")
  --, ((modMask, xK_p), spawn "exe=`~/.xmonad/bin/dmenu_path | yeganesh` && eval \"exec $exe\"")

  -- Switch to single screen mode
  , ((modMask .|. mod1Mask, xK_1),
       spawn "xrandr --output DP-2 --off")

  -- Switch to dual screen mode
  , ((modMask .|. mod1Mask, xK_2),
       spawn "xrandr --output DP-2 --auto --above eDP-1 --primary && feh --bg-tile ~/.xmonad/wallpaper.jpg")

  -- Take a screenshot in select mode.
  -- After pressing this key binding, click a window, or draw a rectangle with
  -- the mouse.
  , ((modMask .|. controlMask, xK_p),
     spawn "~/.xmonad/bin/select-screenshot")

  -- Take full screenshot in multi-head mode.
  -- That is, take a screenshot of everything you see.
  , ((modMask .|. controlMask .|. shiftMask, xK_p),
     spawn "~/.xmonad/bin/screenshot")
      -- Mute volume.
  , ((0, 0x1008ff12),
     spawn "amixer -D pulse set Master 1+ toggle")

  -- Decrease volume.
  , ((0, 0x1008ff11),
     spawn "amixer -D pulse set Master 2%-")

  -- Increase volume.
  , ((0, 0x1008ff13),
     spawn "amixer -D pulse set Master unmute && amixer -D pulse set Master 2%+")

  -- Audio previous.
  , ((0, 0x1008FF16),
     spawn "mpc prev")

  -- Play/pause.
  , ((0, 0x1008FF14),
     spawn "mpc toggle")

  -- Audio next.
  , ((0, 0x1008FF17),
     spawn "mpc next")

      -- Eject CD tray.
  , ((0, 0x1008FF2C),
     spawn "eject -T")

      -- Keyboard Brightness Up
  , ((0, 0x1008ff05),
     spawn "kbdlight up")

      -- Keyboard Brightness Down
  , ((0, 0x1008ff06),
     spawn "kbdlight down")

      -- Screen Brightness Up
  , ((0, 0x1008ff02),
     spawn "xbacklight -inc 8")

      -- Screen Brightness Down
  , ((0, 0x1008ff03),
     spawn "xbacklight -dec 5")
  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)


  , ((mod1Mask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  , ((modMask .|. shiftMask, xK_Tab),
     windows W.focusUp  )

  , ((mod1Mask .|. shiftMask, xK_Tab),
     windows W.focusUp  )

  -- Move focus to the master window.
  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  , ((modMask, xK_b),
     sendMessage ToggleStruts)

  -- Show grid selector
  , ((modMask, xK_g), G.goToSelected $ gsconfig2 orangeColorizer)

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]

  ++

  [
    ((modMask .|. shiftMask, xK_g     ), windowPrompt myXPConfig Goto allWindows)
                        -- { autoComplete = Just 500000 })
  , ((modMask .|. shiftMask, xK_b     ), windowPrompt myXPConfig Bring allWindows)
  ]

  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. mod4Mask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_e, xK_d, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask .|. shiftMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]


------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--

-- logHook = takeTopFocus

------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = startup

myEventHook e = do
     screenCornerEventHook e


startup :: X ()
startup = do
  setWMName "LG3D"
  spawn "xsetroot -solid black"
  --addScreenCorner SCLowerRight (spawn "slock")



------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main = do
  -- xmproc <- spawnPipe "i3status | /usr/bin/xmobar ~/.xmonad/xmobar.hs"
  -- xmproc <- spawnPipe "/usr/bin/xmobar -x 0 ~/.xmonad/xmobar.hs"
  xmproc <- spawnPipe "~/.config/polybar/launch.sh"
  xmonad $ docks $ ewmh defaults {
  --xmonad $ docks defaults {
  --    logHook = dynamicLogWithPP $ xmobarPP {
  --          ppOutput = hPutStrLn xmproc
  --        , ppTitle = xmobarColor xmobarTitleColor "" . shorten 75
  --        , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "#662200"
 --         , ppVisible = xmobarColor xmobarCurrentWorkspaceColor "#221100"
 --         , ppSep = " |  "}
      manageHook = manageDocks <+> myManageHook
  }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = smartBorders $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook,

    -- make fullscreen work in chromium
    handleEventHook    = fullscreenEventHook <+> handleTimerEvent <+> myEventHook
}
