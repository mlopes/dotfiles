function circleci
  xdg-open (git remote -v | grep fetch | awk '{print $2}' | sed 's/git@github.com:/https:\/\/circleci.com\/gh\//' | sed 's/\.git//')
end
