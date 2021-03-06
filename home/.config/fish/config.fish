set -gx FRK_PATH "$HOME/.config/fark"

# Load personal config
source $FRK_PATH/init.fish

for file in $HOME/.config/fish/conf.d/*.fish
   source $file
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
