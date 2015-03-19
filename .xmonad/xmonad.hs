import XMonad
import XMonad.Util.Dzen
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Minimize
import XMonad.Layout.Spacing
import XMonad.Layout.Circle
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.WindowGo
import System.IO
import System.Process

myLayout = tiled ||| Mirror tiled ||| Full
 where  
      -- default tiling algorithm partitions the screen into two panes  
      tiled = spacing 10 $ Tall nmaster delta ratio  
   
      -- The default number of windows in the master pane  
      nmaster = 1  
   
      -- Default proportion of screen occupied by master pane  
      ratio = 2/3  
   
      -- Percent of screen to increment by when resizing panes  
      delta = 5/100  

main = do
 rightBarPipe <- spawnPipe myRightBar 
 leftBarPipe <- spawnPipe myLeftBar

 xmonad $ defaultConfig

  { manageHook = manageDocks<+> manageHook defaultConfig
  ,layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig 
  ,logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn leftBarPipe
      , ppCurrent           =   dzenColor "#ebac54" "#2b2b2b" . pad
      , ppVisible           =   dzenColor "white"   "#2b2b2b" . pad
      , ppHidden            =   dzenColor "#b4cdcd" "#2b2b2b" . pad
      , ppHiddenNoWindows   =   dzenColor "#FFFFFF" "#2b2b2b" . pad
      , ppLayout            =   dzenColor "#b4cdcd" "#2b2b2b" . pad
      --, ppTitle    = (\x -> "")
      , ppTitle             =   (" " ++) . dzenColor "white" "#1B1D1E" . dzenEscape
  }
  ,terminal = myTerminal
  ,modMask = myModMask
  ,borderWidth = myBorderWidth
  ,workspaces = myWorkspaces
  ,focusedBorderColor = myFocusedBorderColor
  }
  `additionalKeys`
  [((myModMask, xK_p), spawn myDmenu) 
  ,((myModMask .|. shiftMask, xK_l), spawn myLocker) 
  ,((myModMask .|. shiftMask, xK_o), spawn myBrowser) 
  ,((myModMask , xK_f), runOrRaise myBrowser (className =? "Firefox"))
  ,((myModMask , xK_d), runOrRaise myMediaPlayer (className =? "Vlc"))
  ,((myModMask , xK_c), runOrRaiseNext myChromium (className =? "Chromium"))
  ,((myModMask , xK_v), runOrRaise "gvim" (className =? "Gvim"))
  --,((myModMask , xK_r), runOrRaiseNext "evince" (className =? "Evince"))
  ,((myModMask , xK_s), raise (className =? "URxvt"))
  ,((myModMask , xK_i), raise (className =? "Eclipse"))
  ,((myModMask , xK_b), sendMessage ToggleStruts)
  ,((myModMask , xK_y), spawn myClipboardManager)
  ,((myModMask , xK_q), spawn "killall conky dzen2 ; xmonad --recompile ; xmonad --restart")
  ,((0, 0x1008FF11), spawn myVolumeDown)
  ,((0, 0x1008FF12), spawn myToggleMute)
  ,((0, 0x1008FF13), spawn myVolumeUp)
  ,((0, 0x1008FF02), spawn myDisplayBrightnessUp)
  ,((0, 0x1008FF03), spawn myDisplayBrightnessDown)
  ,((0, 0x1008FF06), spawn myKeyboardBrightnessDown)
  ,((0, 0x1008FF05), spawn myKeyboardBrightnessUp)
  ]

myTerminal 
    = "urxvt -e zsh -c 'tmux -q has-session && exec tmux attach || exec tmux'"
myBrowser = "firefox"
myMediaPlayer = "vlc"
myChromium = "chromium"
tsocks_chromium = "tsocks chromium"
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["1:web","2:sh","3","4","5","6","7","8:log","9:mail"]
myRightBar = "conky -c .conkyrc | dzen2 -e '' -fn 'Droid:size=8:antialias=true' -x 1280 -w 50% -ta 'r'"
-- -xs 0 = all displays 1= left 2=right
--myStatusBar = "conky -c .conkyrc | dzen2 -e '' -fn 'Uushi:size=8:antialias=true' -xs 2"
myLeftBar = "dzen2 -e '' -fn 'Droid:size=8:antialias=true' -x 0 -y 0 -w 45%  -ta 'l'"
myDmenu = "dmenu_run -b -nb black -nf yellow -sf yellow"
myLocker = "xscreensaver-command --lock"
--myLocker = "slock"
myFocusedBorderColor = "#ebac54"
myVolumeUp = "amixer set Master 10+ && volume_popup.sh"
myVolumeDown = "amixer set Master 10- && volume_popup.sh"
myToggleMute = "amixer set Master toggle && volume_popup.sh"
myDisplayBrightnessUp = "xbacklight -inc 10 && backlight_popup.sh"
myDisplayBrightnessDown = "xbacklight -dec 10 && backlight_popup.sh"
myKeyboardBrightnessUp = "kbdlight up"
myKeyboardBrightnessDown = "kbdlight down"
myClipboardManager = "copyq toggle"

volumeLevel = do
    x <- readProcess "volume_popup.sh" [] []
    return 9

showVolumeLevel x = do
    y <- volumeLevel
    print y

--alert a = dzenConfig centered (show a)
--centered =
--        onCurr (center 200 50)
--    >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
--    >=> addArgs ["-fg", "#80c0ff"]
--    >=> addArgs ["-bg", "#000040"]
