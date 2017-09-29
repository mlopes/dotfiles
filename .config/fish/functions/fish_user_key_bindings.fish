function fish_user_key_bindings
    bind \cb fbr

    if bind -M insert > /dev/null 2>&1
        bind -M insert \cb fbr
    end
end

fzf_key_bindings

