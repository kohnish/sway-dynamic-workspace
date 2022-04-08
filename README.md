# sway-dynamic-workspace
Enable Gnome like dynamic workspace

# ToDo
1. Fix the mess
2. Support multiple monitors

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
   bindsym ctrl+shift+f exec sway-dynamic-workspace

   # Disable cycling workspaces
   bindsym $mod+up exec sway-dynamic-workspace prev
   bindsym $mod+down exec sway-dynamic-workspace next
   # Toggle focus within a workspace
   bindsym $mod+tab exec sway-dynamic-workspace toggle-focus
   # Toggle swap windows within a workspace
   bindsym $mod+s exec sway-dynamic-workspace swap
   ```
