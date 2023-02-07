#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh lsd bat neofetch micro
git clone https://github.com/Virkkunen/termux.git "$HOME/termux-ohmyzsh" --depth 1

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"
echo "alias cls='clear'" >> "$HOME/.zshrc"
echo "alias fetch='clear && neofetch'" >> "$HOME/.zshrc"
echo "alias ls='lsd'" >> "$HOME/.zshrc"
echo "alias ll='ls -hl'" >> "$HOME/.zshrc"
echo "alias la='ls -hal'" >> "$HOME/.zshrc"
echo "alias cat='bat'" >> "$HOME/.zshrc"

git clone https://github.com/catppuccin/bat.git "~/bat" --depth 1
mkdir -p "$(bat --config-dir)/themes"
cp bat/*.tmTheme "$(bat --config-dir)/themes"
bat cache --build
rm -rf bat/
echo "export BAT_THEME='Catppuccin-mocha'" >> "~/.zshrc"
echo "export MICRO_TRUECOLOR=1" >> "~/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "~/.zsh-syntax-highlighting" --depth 1
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git "~/catppuccin-zsh-syntax-highlighting" --depth 1
mkdir ~/.zsh-syntax-highlighting/themes
cp -v ~/catppuccin-zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh-syntax-highlighting/themes
echo "source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> "~/.zshrc"
echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "~/.zshrc"

chsh -s zsh

echo "oh-my-zsh install complete!\nChoose your color scheme now~"
$HOME/.termux/colors.sh

echo "Choose your font now~"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."

exit
