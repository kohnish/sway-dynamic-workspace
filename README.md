# sway-dynamic-workspace
Enable Gnome like dynamic workspace and other minor tools to make sway behave like bspwm

# ToDo
1. Support multiple monitors

# How to use
1. Install sway-dynamic-workspace script in your $PATH.  
   
   e.g. 
   ```
   curl -L https://github.com/kohnish/sway-dynamic-workspace/blob/master/sway-dynamic-workspace -o ~/bin/
   chmod +x ~/bin/sway-dynamic-workspace
   ```

2. Configure key binding in the sway config.  
   
   e.g.  
   ```
   # Move current node to next dynamic workspace (maximize)
   bindsym $mod+f exec sway-dynamic-workspace

   # Disable cycling workspaces
   bindsym $mod+up exec sway-dynamic-workspace prev
   bindsym $mod+down exec sway-dynamic-workspace next

   # Toggle focus within a workspace
   bindsym $mod+tab exec sway-dynamic-workspace toggle-focus

   # Toggle swap windows within a workspace
   bindsym $mod+s exec sway-dynamic-workspace swap

   # Enable quake mode with kitty (needs remember_window_size no in kitty.conf)
   set $toggle_maximize_cmd sway-dynamic-workspace toggle-maximize 3440 700 0 0 3440 1408
   for_window [app_id="kitty_quake"] floating enable, sticky enable, exec $toggle_maximize_cmd
   bindsym f12 exec sway-dynamic-workspace toggle-hidden kitty_quake 'TERM_PROGRAM=kitty_quake kitty --class=kitty_quake --detach'
   bindsym f11 exec $toggle_maximize_cmd

   ```
