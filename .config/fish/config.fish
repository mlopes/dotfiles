# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_suffix blue
set __fish_git_prompt_showuntrackedfiles 'yes'

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_equal ''

#set PATH $HOME/.rbenv/bin $PATH
#set PATH $HOME/.rbenv/shims $PATH
#rbenv rehash >/dev/null ^&1

set -x EDITOR vim
set -x -U SHELL /usr/bin/fish
set PATH /usr/local/bin /home/mlopes/.gem/ruby/2.1.0/bin $PATH
#set PATH $HOME/.rvm/bin $PATH
set PATH ~/.xmonad/bin $PATH
# set -xg TERM screen-256color

