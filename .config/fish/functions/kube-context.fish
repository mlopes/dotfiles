function kube-context
  kubectl config set-context (kubectl config current-context) --namespace=$argv[1]
end
