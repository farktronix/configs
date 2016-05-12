if set -q FRK_PATH
    source $FRK_PATH/config.fish
    source $FRK_PATH/aliases.fish
    if test -f $FRK_PATH/localconfig.fish
        source $FRK_PATH/localconfig.fish
    end
    source $FRK_PATH/workconfig.fish
end
