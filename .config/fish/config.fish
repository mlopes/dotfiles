# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_suffix blue

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
set PATH /usr/local/bin $PATH
#set PATH $HOME/.rvm/bin $PATH
set PATH ~/.xmonad/bin $PATH
# set -xg TERM screen-256color


function fish_prompt
  set last_status $status

  set_color green
  printf '┌─┤%s@%s ' (whoami) (hostname|cut -d . -f 1)

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  printf '%s \n' (__fish_git_prompt)

  set_color green
  printf '└─┤'

  set_color cyan
  printf ' %s ' (date "+%H:%M:%S")

  set_color green
  printf '├─ '
  set_color $fish_color_cwd
  printf '$ '

  set_color normal
end

