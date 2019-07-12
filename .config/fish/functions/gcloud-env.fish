function gcloud-env
  gcloud --project $argv[1] container clusters get-credentials paygplus --region europe-west1;
end
