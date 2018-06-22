export ZSH=/Users/jameshageman/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting)

export GOPATH="$HOME/Documents/Github/personal/go"
export GOBIN="$GOPATH/bin"
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin:$GOBIN:$PATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export VISUAL="mvim"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias dc='docker-compose'
alias git='hub'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gco='git checkout'
alias gl='git log --oneline --decorate --graph '
alias gpo='git push origin '
alias kc='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'

alias vrc='nvim ~/.config/nvim/init.vim '
alias vim='nvim'
alias vi='nvim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias ctags="`brew --prefix`/bin/ctags"
alias dark="set_iterm2_profile Dark && export ITERM_PROFILE=Dark"
alias light="set_iterm2_profile Default && export ITERM_PROFILE=Default"

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function set_iterm2_profile() {
  echo -e "\033]50;SetProfile=$1\a"
}
