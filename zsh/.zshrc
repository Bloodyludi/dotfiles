# dotfiles
for DOTFILE in "$HOME"/.{plugins,path,env,aliases}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# secrets
if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi
