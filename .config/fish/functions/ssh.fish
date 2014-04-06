function ssh
    set -xg SHELL fish; set -xg ssh_env (/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)
    set -xg ssh_env (echo $ssh_env | sed 's/ set -e/; set -e/')                                         
    eval $ssh_env          
    command ssh $argv
end
