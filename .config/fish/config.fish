set -xg SHELL /usr/bin/fish

if status --is-interactive
 eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
end

set __prompt_colour '#FFCA28'
set __prompt_text_colour '#FAB511'
set __prompt_date_colour '#FCD984'

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch white
set __fish_git_prompt_color_suffix '#B511FA'
set __fish_git_prompt_color_prefix '#B511FA'
set __fish_git_prompt_color_flags '#FCD984'
set __fish_git_prompt_color_merging '#FAB511'

set __fish_git_prompt_showcolorhints 1

# Status Chars
set __fish_git_prompt_char_dirtystate ' '
set __fish_git_prompt_char_stagedstate ' '
set __fish_git_prompt_char_stashstate ' '
set __fish_git_prompt_char_upstream_ahead ' '
set __fish_git_prompt_char_upstream_behind ''
set __fish_git_prompt_char_untrackedfiles ' '
set __fish_git_prompt_char_upstream_diverged ' '
set __fish_git_prompt_char_upstream_equal ''

#set PATH $HOME/.rbenv/bin $PATH
#set PATH $HOME/.rbenv/shims $PATH
#rbenv rehash >/dev/null ^&1

set -x EDITOR vim
set -x SHELL /usr/bin/fish
set PATH /home/mlopes/.local/bin /usr/local/bin $PATH
#set PATH $HOME/.rvm/bin $PATH
set PATH ~/.xmonad/bin $PATH
set PATH ~/.local/yarn/bin ~/.config/yarn/global/node_modules/.bin $PATH
# set -xg TERM screen-256color

alias emacs "emacs -nw"
alias update "sudo apt-get update; and sudo apt-get dist-upgrade; and sudo apt autoremove"

source ~/.local/share/icons-in-terminal/icons.fish

kitty + complete setup fish | source

