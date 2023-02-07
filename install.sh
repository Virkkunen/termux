#!/data/data/com.termux/files/usr/bin/bash
termux-change-repo
pkg upgrade -y
pkg install -y micro lsd neofetch openssh topgrade

git clone https://github.com/Virkkunen/termux.git "$HOME/termux-vrkknn"
mv "$HOME/termux-vrkknn/colors"/* "$HOME/.termux/colors"
mv "$HOME/termux-vrkknn/fonts"/* "$HOME/.termux/fonts"

echo "alias cls='clear'" >> "$HOME/.zshrc"
echo "alias fetch='clear && neofetch'" >> "$HOME/.zshrc"
echo "alias ls='lsd'" >> "$HOME/.zshrc"
echo "alias ll='ls -hl'" >> "$HOME/.zshrc"
echo "alias la='ls -hal'" >> "$HOME/.zshrc"
echo "alias auto='apt-get autoremove && apt-get autoclean'" >> "$HOME/.zshrc"

git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
mkdir ~/.zsh
cp "$HOME/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" "$HOME/.zsh/"
sed -i '$d' "$HOME/.zshrc"
echo "source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

git clone https://github.com/catppuccin/micro.git
mkdir -p ~/.config/micro/colorschemes
mv "~/micro/src"/* "~/.config/micro/colorschemes"
echo "export 'MICRO_TRUECOLOR=1'" >> "$HOME/.zshrc"

rm -rf termux-vrkknn
rm -rf termux-ohmyzsh
rm -rf zsh-syntax-highlighting
rm -rf micro
touch .hushlogin

echo "addons install complete!\nChoose your color scheme now"
$HOME/.termux/colors.sh

echo "Choose your font now"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."
exit
