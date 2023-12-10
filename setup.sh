ln -shf `pwd`/.config/nvim ~/.config/nvim
ln -shf `pwd`/.zshrc.local ~/.zshrc.local
source ~/.zshrc.local
grep -q "source ~/.zshrc.local" ~/.zshrc || echo "source ~/.zshrc.local" >> ~/.zshrc
