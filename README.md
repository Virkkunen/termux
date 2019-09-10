# Synthetic Long Exposure
 
1. Install nano, ffmpeg and imagemagick
    ```bash
    apt update && apt install nano ffmpeg imagemagick
    ```
1. Give Termux read/write storage permission with `termux-setup-storage`
1. Create _termux-file-editor_ in ~/bin
    ```bash
    mkdir ~/bin
    cd ~/bin
    nano termux-file editor
    ```
1. Paste code in *termux-file-editor*
    ```bash
    #!/bin/bash
    read -p 'Frame rate: ' -e -i '30' framerate
    read -p 'median, mean, max, min: ' -e -i 'mean' method
    ffmpeg -i "$1" -r $framerate -f image2 'frame_%05d.png'
    ls frame_*.png | xargs -n 30 sh -c 'convert "$0" "$@" -evaluate-sequence mean "x$0" '
    convert x*.png -evaluate-sequence $method -channel RGB -normalize /storage/emulated/0/Download/final.png
    rm *frame*.png
    read -p 'Process complete!'
    ```
    * Save with **Vol Down + O**, quit with **Vol Down + X**
