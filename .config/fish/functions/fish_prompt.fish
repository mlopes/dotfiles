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

