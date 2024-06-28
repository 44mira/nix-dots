{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun -show-icons";

# [[ MONITOR AND ENV ]] {{{
      monitor = [
        "eDP-1,1920x1080@144,auto,1.00"
        ",preferred,auto,auto"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
# }}}

# [[ GENERAL ]] {{{
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        "col.active_border" = "rgba(aaaaaaee) rgba(555555ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;
        allow_tearing = false;

        layout = "dwindle";
      };
# }}}

# [[ DECORATION ]] {{{
      decoration = {
        rounding = 3;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };
# }}}

# [[ ANIMATIONS ]] {{{
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
# }}}

# [[ LAYOUT ]] {{{
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };
# }}}

# [[ MISC ]] {{{
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
# }}}

# [[ INPUT ]] {{{
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures.workspace_swipe = false;

      device = [
        { name = "epic-mouse-v1"; sensitivity = -0.5;}
      ];
# }}}

# [[ KEYBINDINGS ]] {{{1
      "$mainMod" = "SUPER";

      bind = [

        # Screenshot
        "$mainMod, P, wayshot -s $\"(slurp)\" --stdout | wl-copy"
        ", Print, exec, wayshot --stdout | wl-copy"

        # Lock and Powermenu
        "$mainMod, L, exec, hyprlock"
        "$mainMod, BackSpace, exec, rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=shutdown/reboot/logout/suspend/hibernate\""

# [[ Standard binds ]] {{{2
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, f, exec, firefox"
        "$mainMod, W, togglefloating,"
        "$mainMod, A, exec, $menu"
        "$mainMod, J, togglesplit, # dwindle"
        "ALT_L, Return, fullscreen"
# }}}2

# [[ Window binds ]] {{{2
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move focused window around current workspace
        "$mainMod+Shift+Ctrl, Left, movewindow, l"
        "$mainMod+Shift+Ctrl, Right, movewindow, r"
        "$mainMod+Shift+Ctrl, Up, movewindow, u"
        "$mainMod+Shift+Ctrl, Down, movewindow, d"
# }}}2

# [[ Workspace binds ]] {{{2
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
# }}}2
      ];

      # Move with mouse
      bindm = [
        "$mainMod, z, movewindow"
        "$mainmod, x, resizewindow"
      ];
# }}}1

# [[ WINDOWRULES ]] {{{
      windowrulev2 = [
        "opacity 0.95 0.95, class:kitty"
        "suppressevent maximize, class:.* # You'll probably like this."
      ];
# }}}
    };
  };
}
