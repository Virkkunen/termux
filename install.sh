pkg install -y micro lsd bat neofetch

echo "alias cls='clear'" >> "$HOME/.zshrc"
echo "alias fetch='clear && neofetch'" >> "$HOME/.zshrc"
echo "alias ls='lsd'" >> "$HOME/.zshrc"
echo "alias ll='ls -hl'" >> "$HOME/.zshrc"
echo "alias la='ls -hal'" >> "$HOME/.zshrc"
echo "alias cat='bat'" >> "$HOME/.zshrc"

git clone https://github.com/Virkkunen/termux.git "$HOME/termux-vrkknn"
cd termux-vrkknn
mv "colors/*" "$HOME/.termux/colors"
mv "fonts/*" "$HOME/.termux/fonts"
