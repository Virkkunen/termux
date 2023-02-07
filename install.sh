#!/data/data/com.termux/files/usr/bin/bash
termux-change-repo
pkg upgrade -y
pkg install -y micro lsd neofetch 

git clone https://github.com/Virkkunen/termux.git "$HOME/termux-vrkknn"
mv "$HOME/termux-vrkknn/colors"/* "$HOME/.termux/colors"
mv "$HOME/termux-vrkknn/fonts"/* "$HOME/.termux/fonts"

echo "alias cls='clear'" >> "$HOME/.zshrc"
echo "alias fetch='clear && neofetch'" >> "$HOME/.zshrc"
echo "alias ls='lsd'" >> "$HOME/.zshrc"
echo "alias ll='ls -hl'" >> "$HOME/.zshrc"
echo "alias la='ls -hal'" >> "$HOME/.zshrc"

git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cp -v "$HOME/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" "$HOME/.zsh/"
echo "source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

echo "oh-my-zsh install complete!\nChoose your color scheme now"
$HOME/.termux/colors.sh

echo "Choose your font now"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."
exit