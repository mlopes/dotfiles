function ssh
    envoy -t ssh-agent
    eval (envoy -pf | sed 's/-x/-x -U/')  
    command ssh $argv
end
