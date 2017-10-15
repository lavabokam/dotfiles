import XMonad
import qualified Data.Map as M
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Exit
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import qualified XMonad.StackSet as W

rofiLaunchCmd :: String
rofiLaunchCmd = "rofi -combi-modi window,drun,run -show combi -modi combi"

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask, xK_Return), spawn $ XMonad.terminal conf),
    ((modMask, xK_space),  spawn rofiLaunchCmd ),
    ((modMask .|. shiftMask, xK_space), sendMessage NextLayout),
    -- Quit xmonad
    ((modMask .|. shiftMask, xK_q), io (exitWith ExitSuccess)),
    -- Restart XMonad
    ((modMask .|. shiftMask, xK_r), spawn "xmonad --recompile && xmonad --restart"),
    ((modMask , xK_q), kill ),
    ((modMask,  xK_Tab) , windows W.focusDown), 
    ((modMask .|. shiftMask,  xK_Tab) , windows W.focusUp) ,
    ((modMask .|. shiftMask, xK_h), sendMessage Shrink),
    ((modMask .|. shiftMask, xK_l), sendMessage Expand),
    --((modMask, xK_t), withFocused $ windows . W.sink),
    
  ]

myManageHook = composeAll
  [ className =? "Pidgin"  --> doFloat,
    className =? "vlc"     --> doFloat
  ]
  
main = do
  -- spawn xmobar
  xmproc <- spawnPipe "xmobar  ~/.xmonad/xmobarrc"
  xmonad $ def {
    terminal = "urxvt",
    focusFollowsMouse = False,
    keys = myKeys,
    manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
    logHook = dynamicLogWithPP xmobarPP {
        ppOutput = hPutStrLn xmproc,
        ppTitle = xmobarColor "green" "" . shorten 50,
        ppSep = "  "
        }
    }
