alias refresh "source ~/.config/fish/config.fish"

alias myhost "curl ifconfig.io/host"
alias cat bat
alias top htop
#alias du "ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias copylogs "/System/Library/PrivateFrameworks/MobileDevice.framework/Versions/A/AppleMobileDeviceHelper.app/Contents/Resources/MDCrashReportTool --target 225aeb0e33e33d78d8792877bbb085fc12cf9217"

alias ping "prettyping --nolegend"

alias j jump
switch (uname)
    case Darwin 
        alias git "xcrun git"
        alias openx "open *.xcodeproj"
end
alias grep "grep --color"
#alias tmux "tmux -2 -u"

function mosht --wraps mosh --description 'alias mosht=mosh $argv -- tmux a'
  mosh $argv -- tmux a
end

alias filtr "mosht filtr.home.rkas.net $argv"
alias sim "xcrun simctl"

function bootedSim
    xcrun simctl list devices | grep Booted | cut -d '(' -f 2 | cut -d ')' -f 1
end

function simhome
    cd (xcrun simctl getenv (bootedSim) HOME)
end

function cdsimapp
    cd (xcrun simctl get_app_container (bootedSim) $argv[1] data)
end

function cdrelisten
    cdsimapp com.alecgorge.ios.Listen-to-the-Dead
end

function cdphishod
    cdsimapp com.alecgorge.Phish-Tracks
end

function psgrep
    ps auxwww | grep -v grep | grep -i $argv
end

function ducks
    du -cks * | sort -nr | head -n 10
end

function rot13
    pbpaste | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
end

function mvo -a filename
    set filename (echo $filename | sed -e 's/\(.*\)\/$/\1/')
    
    if test -e "$filename.orig"
        if test -w "$filename.orig"
            rm -rf "$filename.orig"
        else      
            sudo rm -rf "$filename.orig"
        end
    end

    if test -w "$filename"
        mv "$filename"{,.orig}
    else
        sudo mv "$filename"{,.orig}
    end
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

# Disable the vim mode indicator in the command prompt (fish >= 2.3.1)
function fish_mode_prompt
    # NOOP - Disable vim mode indicator
end

function scroll
    set delay "0.5"
    if count $argv > 1
        set delay "$argv[1]"
    end
    while read curLine; echo $curLine; sleep $delay; end
end

function pwc
    pbpaste | wc -l
end

