# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"

# Launch neofetch when terminal opens
neofetch

# dotfiles
for DOTFILE in "$HOME"/.{plugins,path,env,aliases}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# secrets
if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
