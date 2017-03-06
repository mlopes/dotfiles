
function fbr
    set -l branches (git branch -a | grep -v "\->" | cut -c 3-);
    echo "$branches" | tr ' ' '\n' | fzf +s +m -e | read -l branch
    git checkout (echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::");
end

