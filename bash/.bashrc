# Extends default .bashrc provided by the distribution.

export PATH="/home/$USER/go/bin:$PATH"
export EDITOR="vim"

alias c="clear"
alias x="exit"
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

repoclone() {
    URL="$1"
    DIR=$(echo $URL | sed 's|https\?://||' | sed 's|git@||' | sed 's|:|/|' | sed 's|\.git$||')

    mkdir -p "$DIR"
    git clone "$URL" "$DIR"

    echo "To open cloned repository:"
    echo "cd $DIR"
}
