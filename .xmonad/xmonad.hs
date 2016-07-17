import XMonad
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders(smartBorders)
import System.IO
import XMonad.Config.Xfce
import XMonad.Config.Bluetile
import XMonad.Util.Replace
import XMonad.Hooks.SetWMName
myWorkSpace=["1:main","2:web","others"]
main = do
--     spawn "xmodmap /home/innocent/.xmodmap"
 {-
 spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut ture --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16"
    spawn "wicd-client -t"
    spawn "nm-applet --sm-disable"
    -}
    xmonad $ xfceConfig
     {
        terminal  = myTerminal
            ,	modMask   = myModMask
            ,	borderWidth  = 3
            ,	focusedBorderColor = "#FF3399"
            ,	manageHook = manageDocks <+> manageHook defaultConfig 
            ,	layoutHook = myLayoutHook
            ,   workspaces = myWorkSpace
            ,   startupHook = setWMName "LG3D"
     }

myTerminal = "guake"
myModMask = mod4Mask

myLayoutHook = avoidStruts $ tiled1 ||| nobordersLayout
    where
        tiled1 = spacing 3 $ Tall nmaster1 delta ratio
        nmaster1 = 1 --The default number of widows in the master pane
        ratio = 1/2 --default proportion of screen occupied by master pane
        delta = 3/100 -- Percent of screen to increment by when resizing panes
        nobordersLayout = smartBorders $ Full    

{-myManageHook = composeAll
    [className =? "File Operation Progress" --> doFloat
    , resource =? "desktop_window" --> doIgnore
    , className =? "chromium" --> doShift "2:web"
    , className =? "mikutter" --> doShift "3:Twitter"
    ]
-}

