#!/bin/bash
dest_dir=~/bin/

cd "$( dirname -- "${BASH_SOURCE[0]}" )"
cp sway-dynamic-workspace $dest_dir
chmod +x ~/bin/sway-dynamic-workspace
cp sway-keep-workspace $dest_dir
chmod +x ~/bin/sway-keep-workspace
cp sway-resize $dest_dir
chmod +x ~/bin/sway-resize
cd hello-wayland
# sudo dnf install -y wayland-devel wayland-protocols-devel ImageMagick-devel
make
cp --force hello-wayland $dest_dir
