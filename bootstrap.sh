#!/bin/bash
set -e

# ─── ──── ──── ──── ──── ──── ────
# chezmoi bootstrap: install system deps
# ─── ──── ──── ──── ──── ──── ────

echo ">>> Bootstrap: installing dependencies..."

install_apt_packages() {
    sudo apt update
    sudo apt install -y \
        zsh tmux vim kitty \
        clang clang-tidy \
        waybar wofi \
        hyprland hyprlock hypridle \
        fcitx5 fcitx5-chinese-addons \
        wireplumber pavucontrol \
        ripgrep fd-find lsd bat \
        zoxide
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo ">>> Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
}

install_fnm() {
    if ! command -v fnm &>/dev/null; then
        echo ">>> Installing fnm..."
        curl -fsSL https://fnm.vercel.app/install | bash
    fi
}

install_pupt() {
    if ! command -v pupt &>/dev/null; then
        echo ">>> Installing pupt from source..."
        cargo install --git https://github.com/YardRat0117/pupt
    fi
}

# Detect OS
if command -v apt &>/dev/null; then
    install_apt_packages
elif command -v dnf &>/dev/null; then
    sudo dnf install -y zsh tmux vim kitty clang waybar wofi hyprland fcitx5 wireplumber ripgrep fd-find lsd bat zoxide
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm zsh tmux vim kitty clang waybar wofi hyprland fcitx5 wireplumber ripgrep fd lsd bat zoxide
fi

install_oh_my_zsh
install_fnm
install_pupt

echo ">>> Bootstrap complete!"
