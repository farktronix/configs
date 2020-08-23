set -gx FRK_PATH "$HOME/.config/fark"

# Load personal config
source $FRK_PATH/init.fish

for file in $HOME/.config/fish/conf.d/*.fish
   source $file
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -x PATH "$HOME/.pyenv/bin" $PATH
set -x PATH "$HOME/gs-venv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
