# sway-dynamic-workspace
Enable dynamic workspace and empty workspace for sway like gnome and bspwm

# ToDo
1. Support multiple monitors
2. Rewrite fully in C

# How to use
1. Install sway-dynamic-workspace script in your $PATH.  
   
   e.g. in case of ~/bin
   ```
   git clone https://github.com/kohnish/sway-dynamic-workspace.git
   cd sway-dynamic-workspace
   cp sway-dynamic-workspace ~/bin/
   chmod +x ~/bin/sway-dynamic-workspace
   cp sway-keep-workspace ~/bin/
   chmod +x ~/bin/sway-keep-workspace
   cp sway-resize ~/bin/
   chmod +x ~/bin/sway-resize
   cd hello-wayland
   sudo dnf install -y wayland-devel wayland-protocols-devel ImageMagick-devel
   make
   cp hello-wayland ~/bin/
   ```

2. Configure key binding in the sway config.  
   
   e.g.  
   ```
   # A daemon to keep one empty workspace (requires executable called hello-wayland(blank dot gui process) in the PATH)
   # It'll create an empty black dot node named blank to stop sway from killing empty workspaces.
   for_window [app_id="blank"] floating enable   
   exec sway-keep-workspace

   # Move current node to next dynamic workspace (maximize)
   # For the *maximised* window, it'll bring back to the first workspace.
   bindsym $mod+f exec sway-dynamic-workspace

   # Next or prev workspace to avoid the default cycling behaviour
   bindsym $mod+up exec sway-dynamic-workspace prev
   bindsym $mod+down exec sway-dynamic-workspace next

   # Toggle focus to a next window across workspaces or use app-switcher if you have fuzzel
   bindsym $mod+tab exec sway-dynamic-workspace toggle-focus
   bindsym $mod+tab exec sway-dynamic-workspace app-switcher

   # Toggle swap windows within a workspace
   bindsym $mod+s exec sway-dynamic-workspace swap

   # Enable quake mode with alacritty
   for_window [app_id="alacritty_quake"] floating enable, sticky enable, exec $toggle_maximize_cmd
   
   # Starts alacritty when it's not started, otherwise toggle the visibility.
   bindsym f12 exec sway-dynamic-workspace toggle-hidden alacritty_quake 'TERM_PROGRAM=alacritty_quake alacritty --class=alacritty_quake --detach'
   
   # When the focused floating window unmaximised, resize to width 100%, height 50%, starting x and y position 0,
   # otherwise maximise (not the fullscreen of sway to keep floating behaviour)
   bindsym f11 exec sway-dynamic-workspace toggle-maximize 100 50 0 0
   
   # For waybar user, correct the size of quake mode display calculating from the (non-)waybar position.
   bindsym ctrl+shift+p exec sh -c "pkill -SIGUSR1 waybar ; $toggle_maximize_cmd ; $toggle_maximize_cmd"
   
   # Move focused node to some workspace by index (0 based)
   bindsym ctrl+shift+1 exec sway-dynamic-workspace move-to-workspace 0
   bindsym ctrl+shift+2 exec sway-dynamic-workspace move-to-workspace 1
   bindsym ctrl+shift+3 exec sway-dynamic-workspace move-to-workspace 2   
   bindsym ctrl+shift+4 exec sway-dynamic-workspace move-to-workspace 3
   bindsym ctrl+shift+5 exec sway-dynamic-workspace move-to-workspace 4

   
   # Resize nodes
   bindsym ctrl+shift+h exec sway-resize left 1
   bindsym ctrl+shift+l exec sway-resize right 1
   bindsym ctrl+shift+j exec sway-resize down 1
   bindsym ctrl+shift+k exec sway-resize up 1
   ```
