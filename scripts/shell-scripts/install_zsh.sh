#!/bin/bash

# Function to install Zsh
install_zsh() {
  echo "Installing Zsh..."
  sudo pacman -S --noconfirm zsh
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

# Function to install Powerlevel10k (optional, for better prompt)
install_powerlevel10k() {
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
}

# Function to install Zsh plugins
install_plugins() {
  echo "Installing plugins: zsh-autosuggestions, zsh-syntax-highlighting..."
  
  # Install zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  # Install zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
}

# Function to set Zsh as the default shell
set_zsh_default() {
  echo "Setting Zsh as the default shell..."
  chsh -s $(which zsh)
}

# Function to install Nerd Fonts (optional for icons)
install_nerd_fonts() {
  echo "Installing Nerd Fonts..."
  sudo pacman -S --noconfirm nerd-fonts-complete
}

# Function to update .zshrc file for theme and plugins
update_zshrc() {
  echo "Configuring .zshrc file..."
  
  # Set Powerlevel10k theme
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
  
  # Enable plugins
  echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc
  
  # Source the plugins
  echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
  echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
}

# Main installation function
main() {
  install_zsh
  install_oh_my_zsh
  install_powerlevel10k
  install_plugins
  install_nerd_fonts
  update_zshrc
  set_zsh_default

  echo "Installation complete! Please restart your terminal."
}

# Execute the main function
main
