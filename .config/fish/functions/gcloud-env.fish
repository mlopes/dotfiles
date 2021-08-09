function gcloud-env
  if test "$argv[1]" = "smile"
    gcloud --project $argv[2] container clusters get-credentials turbo --region europe-west1;
  else if test "$argv[1]" = "boost-nonprod-198211"
    gcloud --project $argv[1] container clusters get-credentials vibe-nonprod-billy --region europe-west1
  else if test "$argv[1]" = "boost-prod"
    gcloud --project $argv[1] container clusters get-credentials vibe-prod-billy --region europe-west1
  end
end
