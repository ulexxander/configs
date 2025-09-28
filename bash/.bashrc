# Extends default .bashrc provided by the distribution.

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/$USER/go/bin"

export EDITOR="vim"

alias c="clear"
alias ghis="history | grep"
alias gdf="git diff --no-index"

alias gt="gotest -v"
alias gtc="gotest -v --coverprofile=coverage.out"
alias gr="go run"
alias gcoh="go tool cover -html=coverage.out"

alias yd="yarn dev"

alias d="docker"
alias dc="docker compose"

alias m="make"

_fzf_setup_completion path kubectl k helm h jq yq

# https://gitlab.dev.limitlex.io/devops/infrastructure/-/blob/master/tools/.bashrc
lc() {
  __LF_LAST_DIR=$(lf -print-last-dir)
  if [ "$__LF_LAST_DIR" != "$PWD" ]; then
    cd "$__LF_LAST_DIR"
  fi
}

repoclone() {
  URL="$1"
  DIR=$(echo $URL | sed 's|https\?://||' | sed 's|git@||' | sed 's|:|/|' | sed 's|\.git$||')

  mkdir -p "$DIR"
  git clone $@ "$DIR"

  echo "To open cloned repository:"
  echo "cd $DIR"
}

pasc() {
  local entry=$(find ~/.password-store/ -name '*.gpg' -printf "%P\n" | sed 's/.gpg$//' | fzf)
  if [ "$entry" != "" ]; then
    pass "$entry" -c $@
  fi
}

pasf() {
  find ~/.password-store/ -name '*.gpg' -printf "%P\n" | sed 's/.gpg$//' | fzf
}

pasl() {
  pass | less -R
}

