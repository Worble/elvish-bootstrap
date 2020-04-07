mkdir -p ~/.config/lxqt/
echo '[General]
AllowGrabBaseKeypad=true
AllowGrabBaseSpecial=false
AllowGrabLocks=false
AllowGrabMiscKeypad=true
AllowGrabMiscSpecial=true
MultipleActionsBehaviour=first
WindowSize=@Size(750 400)

[Alt%2BF2.1]
Comment=Show/hide runner dialog
Enabled=true
path=/runner/show_hide_dialog

[Control%2BAlt%2BD.2]
Comment=Show desktop
Enabled=true
path=/panel/showdesktop/show_hide

[Control%2BAlt%2BE.3]
Comment=Pcmanfm
Enabled=true
Exec=pcmanfm-qt

[Control%2BAlt%2BI.4]
Comment=Web browser
Enabled=true
Exec=xdg-open, about:blank

[Control%2BAlt%2BL.5]
Comment=lockscreen
Enabled=true
Exec=xdg-screensaver, lock

[Control%2BAlt%2BT.6]
Comment=alacritty
Enabled=true
Exec=alacritty

[Control%2BF1.7]
Comment=Switch to desktop 1
Enabled=true
path=/panel/desktopswitch2/desktop_1

[Control%2BF1.8]
Comment=Switch to desktop 1
Enabled=true
path=/panel/desktopswitch/desktop_1

[Control%2BF10.10]
Comment=Switch to desktop 10
Enabled=true
path=/panel/desktopswitch/desktop_10

[Control%2BF10.9]
Comment=Switch to desktop 10
Enabled=true
path=/panel/desktopswitch2/desktop_10

[Control%2BF11.11]
Comment=Switch to desktop 11
Enabled=true
path=/panel/desktopswitch2/desktop_11

[Control%2BF11.12]
Comment=Switch to desktop 11
Enabled=true
path=/panel/desktopswitch/desktop_11

[Control%2BF12.13]
Comment=Switch to desktop 12
Enabled=true
path=/panel/desktopswitch/desktop_12

[Control%2BF12.14]
Comment=Switch to desktop 12
Enabled=true
path=/panel/desktopswitch2/desktop_12

[Control%2BF2.15]
Comment=Switch to desktop 2
Enabled=true
path=/panel/desktopswitch/desktop_2

[Control%2BF2.16]
Comment=Switch to desktop 2
Enabled=true
path=/panel/desktopswitch2/desktop_2

[Control%2BF3.17]
Comment=Switch to desktop 3
Enabled=true
path=/panel/desktopswitch/desktop_3

[Control%2BF3.18]
Comment=Switch to desktop 3
Enabled=true
path=/panel/desktopswitch2/desktop_3

[Control%2BF4.19]
Comment=Switch to desktop 4
Enabled=true
path=/panel/desktopswitch/desktop_4

[Control%2BF4.20]
Comment=Switch to desktop 4
Enabled=true
path=/panel/desktopswitch2/desktop_4

[Control%2BF5.21]
Comment=Switch to desktop 5
Enabled=true
path=/panel/desktopswitch/desktop_5

[Control%2BF5.22]
Comment=Switch to desktop 5
Enabled=true
path=/panel/desktopswitch2/desktop_5

[Control%2BF6.23]
Comment=Switch to desktop 6
Enabled=true
path=/panel/desktopswitch/desktop_6

[Control%2BF6.24]
Comment=Switch to desktop 6
Enabled=true
path=/panel/desktopswitch2/desktop_6

[Control%2BF7.25]
Comment=Switch to desktop 7
Enabled=true
path=/panel/desktopswitch/desktop_7

[Control%2BF7.26]
Comment=Switch to desktop 7
Enabled=true
path=/panel/desktopswitch2/desktop_7

[Control%2BF8.27]
Comment=Switch to desktop 8
Enabled=true
path=/panel/desktopswitch/desktop_8

[Control%2BF8.28]
Comment=Switch to desktop 8
Enabled=true
path=/panel/desktopswitch2/desktop_8

[Control%2BF9.29]
Comment=Switch to desktop 9
Enabled=true
path=/panel/desktopswitch/desktop_9

[Control%2BF9.30]
Comment=Switch to desktop 9
Enabled=true
path=/panel/desktopswitch2/desktop_9

[Meta%2B0.31]
Comment=Activate task 10
Enabled=true
path=/panel/taskbar/task_10

[Meta%2B1.32]
Comment=Activate task 1
Enabled=true
path=/panel/taskbar/task_1

[Meta%2B2.33]
Comment=Activate task 2
Enabled=true
path=/panel/taskbar/task_2

[Meta%2B3.34]
Comment=Activate task 3
Enabled=true
path=/panel/taskbar/task_3

[Meta%2B4.35]
Comment=Activate task 4
Enabled=true
path=/panel/taskbar/task_4

[Meta%2B5.36]
Comment=Activate task 5
Enabled=true
path=/panel/taskbar/task_5

[Meta%2B6.37]
Comment=Activate task 6
Enabled=true
path=/panel/taskbar/task_6

[Meta%2B7.38]
Comment=Activate task 7
Enabled=true
path=/panel/taskbar/task_7

[Meta%2B8.39]
Comment=Activate task 8
Enabled=true
path=/panel/taskbar/task_8

[Meta%2B9.40]
Comment=Activate task 9
Enabled=true
path=/panel/taskbar/task_9

[Print.41]
Comment=screen shot
Enabled=true
Exec=lximage-qt, -s

[Shift%2BControl%2BF6.42]
Comment=\x2600 \x2193
Enabled=true
Exec=lxqt-config-brightness, -d

[Shift%2BControl%2BF7.43]
Comment=\x2600 \x2191
Enabled=true
Exec=lxqt-config-brightness, -i

[Super_L.44]
Comment=Show/hide main menu
Enabled=true
path=/panel/mainmenu/show_hide

[XF86AudioLowerVolume.45]
Comment=Decrease sound volume
Enabled=true
path=/panel/volume/down

[XF86AudioMute.46]
Comment=Mute/unmute sound volume
Enabled=true
path=/panel/volume/mute

[XF86AudioRaiseVolume.47]
Comment=Increase sound volume
Enabled=true
path=/panel/volume/up

[XF86MonBrightnessDown.48]
Comment=\x2600 \x2193
Enabled=true
Exec=lxqt-config-brightness, -d

[XF86MonBrightnessUp.49]
Comment=\x2600 \x2191
Enabled=true
Exec=lxqt-config-brightness, -i' > ~/.config/lxqt/globalkeyshortcuts.conf