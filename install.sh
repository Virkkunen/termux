#!/data/data/com.termux/files/usr/bin/bash
termux-change-repo

git clone https://github.com/Virkkunen/termux.git "$HOME/termux-vrkknn"
mv "$HOME/termux-vrkknn/colors"/* "$HOME/.termux/colors"
mv "$HOME/termux-vrkknn/fonts"/* "$HOME/.termux/fonts"

echo "alias cls='clear'" >> "$HOME/.zshrc"
echo "alias fetch='clear && neofetch'" >> "$HOME/.zshrc"
echo "alias ls='lsd'" >> "$HOME/.zshrc"
echo "alias ll='ls -hl'" >> "$HOME/.zshrc"
echo "alias la='ls -hal'" >> "$HOME/.zshrc"

pkg upgrade -y
pkg install -y micro lsd neofetch 

echo "oh-my-zsh install complete!\nChoose your color scheme now"
$HOME/.termux/colors.sh

echo "Choose your font now"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."
exit