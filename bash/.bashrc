export PS1="\[\e[0;32m\]\w \[\e[0m\]"

shopt -s autocd
set -o vi

xset r rate 125 35

export EDITOR="nvim"
export VISUAL="nvim"

HISTSIZE=10000
HISTFILESIZE=10000

alias c="clear"
alias x="exit"
alias v="nvim"
alias code="vscodium"
alias yd="yarn dev"
alias ytc="yarn typecheck"
alias gr="go run main.go"
alias gp="cd $(go env GOPATH)/src/gitlab.com/ulexxander"
alias ghis="history | grep"
alias la="ls -la"
alias vim="nvim"

alias gcoh="go tool cover -html=.tmp/cp.out"

alias gp="git push"
alias gpl="git pull"
alias gc="git checkout"
alias gl="git log"

alias d="docker"
alias dc="docker-compose"
alias dcl="docker-compose -f docker-compose-local.yml"

export ANDROID_SDK_ROOT=/opt/Android/Sdk

export PATH="/opt/Android/Sdk/platform-tools:/opt/Android/Sdk/emulator:/opt/Android/Sdk/tools:/home/ulexxander/go/bin:$PATH"

export DHIP=172.17.0.1


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
