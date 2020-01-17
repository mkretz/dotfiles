# Load the shell dotfiles
# extra.zsh can be used for settings you don’t want to commit.
for file in ~/.zsh.d/*.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# History navigation commands
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Start tmux for every terminal session
[[ -z "$TMUX" && $(tty) != /dev/tty[0-9] ]] && { tmux || exec tmux new-session && exit }

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/taakrma0/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
