function fish_prompt
  set last_status $status

  set fish_color_cwd $__prompt_colour

  set_color $__prompt_text_colour
  printf '┌─┤%s@%s ' (whoami) (hostname|cut -d . -f 1)

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  printf '%s \n' (__fish_git_prompt)

  set_color $__prompt_text_colour
  printf '└─┤'

  set_color $__prompt_date_colour
  printf ' %s ' (date "+%H:%M:%S")

  set_color $__prompt_text_colour
  printf '├─ '
  set_color $fish_color_cwd
  printf '$ '

  set_color normal
end

