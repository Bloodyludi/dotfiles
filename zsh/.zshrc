# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle aws
antigen bundle kubernetes
antigen bundle brew
antigen bundle bundler
antigen bundle asdf
antigen bundle ag

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Jetbrains Toolbox
export PATH="$HOME/.toolbox/:$PATH"

# VS Code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export EDITOR="code -w"

# Sublime Merge
export PATH="$HOME/.sublime/:$PATH"

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# thefuck
eval $(thefuck --alias)

# helm
export PATH="/opt/homebrew/opt/helm@2/bin:$PATH"

# secrets
if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi
