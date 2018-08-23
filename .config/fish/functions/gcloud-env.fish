function gcloud-env
  gcloud container clusters get-credentials $argv[1]-kubernetes-01 --zone europe-west2-a --project $argv[1];
end
