alias refresh "source ~/.config/fish/config.fish"

alias j jump
alias git "xcrun git"
alias grep "grep --color"
alias openx "open *.xcodeproj"
alias tmux "tmux -2 -u"

function psgrep
    ps auxwww | grep -v grep | grep -i $argv
end

function ducks
    du -cks * | sort -nr | head -n 10
end

function rot13
    pbpaste | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
end

function mvo
    mv $argv[1]{,.orig}
end

set -g _farkGitHomeUser "jacobf@rkas.net"
set -g _farkGitHomeSigningKey "B9BD49AC"
set -g _farkGitWorkUser "farkas@apple.com"
set -g _farkGitWorkSigningKey "D05C1FB4"

function _setGitUser -a email signingkey isGlobal
    set globalFlag 
    set globalString ""
    if [ "$isGlobal" = "global" ]
        set globalFlag "--global"
        set globalString "global "
    end
    git config $globalFlag user.email "$email"
    git config $globalFlag user.signingKey "$signingkey"

    echo "Set "$globalString"git user to $email/$signingkey"
end

function signWork
    _setGitUser $_farkGitWorkUser $_farkGitWorkSigningKey "global"
end

function localSignWork
    _setGitUser $_farkGitWorkUser $_farkGitWorkSigningKey
end

function signHome
    _setGitUser $_farkGitHomeUser $_farkGitHomeSigningKey "global"
end

function localSignHome
    _setGitUser $_farkGitHomeUser $_farkGitHomeSigningKey
end

