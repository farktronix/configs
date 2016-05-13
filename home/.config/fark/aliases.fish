alias refresh "source ~/.config/fish/config.fish"

alias j jump

alias git "xcrun git"

alias grep "grep --color"

alias openx "open *.xcodeproj"

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
