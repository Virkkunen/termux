# Youtube-dl
  
1. Download Python and nano
    ```bash
    apt update && apt install nano python
    ```
1. Give Termux read/write storage permission with `termux-setup-storage`
1. Install youtube-dl
    ```bash
    pip install youtube-dl
    ```
1. Create a folder where videos will be stored
    ```bash
    mkdir /data/data/com.termux/files/home/storage/shared/YouTube
    ```
1. Create youtube-dl config
    ```bash
    mkdir -p ~/.config/youtube-dl
    nano ~/.config/youtube-dl/config
    ```
1. Paste code into config file
    ```bash
    --no-mtime
    -o /data/data/com.termux/files/home/storage/shared/YouTube/%(title)s.%(ext)s
    -f "best[height<=2160]"
    ```
    * Save with **Vol Down + O**, quit with **Vol Down + X**
1. Create **termux-url-opener** in **~/bin**
    ```bash
    mkdir ~/bin
    cd ~/bin
    nano termux-url-opener
    ```
1. Paste code into **termux-url-opener**
    ```bash
    youtube-dl $1
    ```
    * Save with **Vol Down + O**, quit with **Vol Down + X**
    
     
# Synthetic Long Exposure
  
1. Install nano, ffmpeg and imagemagick
    ```bash
    apt update && apt install nano ffmpeg imagemagick
    ```
1. Give Termux read/write storage permission with `termux-setup-storage`
1. Create **termux-file-editor** in **~/bin**
    ```bash
    mkdir ~/bin
    cd ~/bin
    nano termux-file editor
    ```
1. Paste code in **termux-file-editor**
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
