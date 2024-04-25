{ pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        #Wayland
        xwayland
        wl-clipboard
        cliphist
        #WM
        hyprland
        xdg-desktop-portal-hyprland
        waybar
	    wofi
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            "$mainMod" = "SUPER";
            monitor = eDP-1,2880x1800@60,0x0,2;
            env = [
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                "XCURSOR_SIZE,36"
                "QT_QPA_PLATFORM,wayland"
                "XDG_SCREENSHOTS_DIR,~/screens"
                "QT_QPA_PLATFORMTHEME,qt5ct"
                "GTK_SCALE,2"
                "ELECTRON_OZONE_PLATFORM_HINT,wayland"
                "GTK_THEME,Catppuccin-Mocha-Standard-Pink-Dark"
            ];
            
            debug = {
                disable_logs = false;
                enable_stdout_logs = true;
            };

            input = {
                kb_layout = "us,ru";
                kb_variant = "lang";
                kb_options = "grp:win_space_toggle";

                follow_mouse = 1;

                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.7;
                };
                sensitivity = 0;
            };

            general = {
                gaps_in = 3;
                gaps_out = 10;
                border_size = 1;
                "col.active_border" = "rgb(F5C2E7) rgb(CBA6F7) 45deg";
                "col.inactive_border" = "rgba(595959aa)";
                resize_on_border = true;
                layout = "dwindle"
                allow_tearing = false;
            };

            decoration = {
                rounding = 10;
                blur = {
                    enable = true;
                    size = 3;
                    passes = 1;
                    new_optimizations = true;
                };
                drop_shadows = true;
                shadow_range = 4;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = true;
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows,     1, 7,  myBezier"
                    "windowsOut,  1, 7,  default, popin 80%"
                    "border,      1, 10, default"
                    "borderangle, 1, 8,  default"
                    "fade,        1, 7,  default"
                    "workspaces,  1, 6,  default"
                    ];
            };
            dwindle = {
                pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true; # you probably want this
            };
            master = {
                new_is_master = true;
            };
            gestures = {
                workspace_swipe = true;
                workspace_swipe_fingers = 3;
                workspace_swipe_invert = false;
                workspace_swipe_distance = 200;
                workspace_swipe_forever = true;
            };
            misc = {
                animate_manual_resizes = true;
                animate_mouse_windowdragging = true;
                enable_swallow = true;
                render_ahead_of_time = false;
                disable_hyprland_logo = true;
            };
            windowrule = [
                "float, ^(imv)$"
                "float, ^(mpv)$"
            ];
            exec-once = [
                "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"
                "dunst"
                "hypridle"
                "hyprpaper"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"

            ];
            bind = [
                "$mainMod, Q, exec, $terminal"
                "$mainMod, C, killactive"
                "$mainMod, M, exit"
                "$mainMod, E, exec, $fileManager"
                "$mainMod, V, togglefloating"
                "$mainMod, R, exec, $menu"
                "$mainMod, P, pseudo" # dwindle
                "$mainMod, S, togglesplit" # dwindle

                # Move focus with mainMod + arrow keys
                "$mainMod, H, movefocus, l"
                "$mainMod, L, movefocus, r"
                "$mainMod, K, movefocus, u"
                "$mainMod, J, movefocus, d"

                # Switch workspaces with mainMod + [0-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"
                
                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"
                
                # Example special workspace (scratchpad)
                "$mainMod, S, togglespecialworkspace, magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"
                
                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
                "$mainMod, B, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
            ];
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];
        };
    };
}