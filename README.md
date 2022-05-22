# sway-dynamic-workspace
Enable dynamic workspace and empty workspace for sway like gnome and bspwm

# ToDo
1. Support multiple monitors

# How to use
1. Install sway-dynamic-workspace script in your $PATH.  
   
   e.g. 
   ```
   git clone https://github.com/kohnish/sway-dynamic-workspace.git
   cd sway-dynamic-workspace
   cp sway-dynamic-workspace -o ~/bin/
   chmod +x ~/bin/sway-dynamic-workspace
   cp sway-keep-workspace -o ~/bin/
   chmod +x ~/bin/sway-keep-workspace
   cp sway-resize -o ~/bin/
   chmod +x ~/bin/sway-resize
   cd hello-wayland
   make
   cp hello-wayland ~/bin/
   ```

2. Configure key binding in the sway config.  
   
   e.g.  
   ```
   # Always keep one empty workspace (requires executable called hello-wayland(blank dot gui process) in the PATH)
   exec sway-keep-workspace

   # Move current node to next dynamic workspace (maximize)
   bindsym $mod+f exec sway-dynamic-workspace

   # Disable cycling workspaces
   bindsym $mod+up exec sway-dynamic-workspace prev
   bindsym $mod+down exec sway-dynamic-workspace next

   # Toggle focus within a workspace
   bindsym $mod+tab exec sway-dynamic-workspace toggle-focus

   # Toggle swap windows within a workspace
   bindsym $mod+s exec sway-dynamic-workspace swap

   # Enable quake mode with alacritty
   set $toggle_maximize_cmd sway-dynamic-workspace toggle-maximize 3440 700 0 0 3440 1408
   for_window [app_id="alacritty_quake"] floating enable, sticky enable, exec $toggle_maximize_cmd
   bindsym f12 exec sway-dynamic-workspace toggle-hidden alacritty_quake 'TERM_PROGRAM=alacritty_quake alacritty --class=alacritty_quake --detach'
   bindsym f11 exec $toggle_maximize_cmd

   # Resize nodes
   bindsym ctrl+shift+h exec sway-resize left 1
   bindsym ctrl+shift+l exec sway-resize right 1
   bindsym ctrl+shift+j exec sway-resize down 1
   bindsym ctrl+shift+k exec sway-resize up 1
   ```
