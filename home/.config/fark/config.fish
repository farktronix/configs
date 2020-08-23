set fish_key_bindings fish_vi_key_bindings

set -g theme_display_vagrant no
set -g theme_display_hg no
set -g theme_display_virtualenv no
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_vi no
set -g theme_display_vi_hide_mode default
set -g theme_display_full_path yes
set -g theme_date_format "+%H:%M:%S"
set -g theme_avoid_ambiguous_glyphs yes
set -g default_user pharkas

set EDITOR vim

set -g GEM_HOME ~/.gems

set -g fish_user_paths ~/bin ~/.gems/bin $fish_user_paths
if test -d ~/bin/gittools
    set -g fish_user_paths ~/bin/gittools $fish_user_paths
end
if test -d ~/gs-venv/bin
    set -g fish_user_paths ~/gs-venv/bin $fish_user_paths
end
if test -d $GOPATH/bin
    set -g fish_user_paths $GOPATH/bin $fish_user_paths
end

function fish_greeting
    status --is-login
    if [ $status != 0 ]
        /bin/cat /run/motd.dynamic
    end
end
