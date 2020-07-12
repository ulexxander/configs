function fish_greeting
end

function fish_user_key_bindings
  bind \e\[3\;5~ kill-word
  bind \cH backward-kill-word
end

alias c='clear'
alias x='exit'

set PATH $PATH /home/ulexxander/.config/composer/vendor/bin
