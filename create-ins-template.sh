gcloud compute instance-templates create google-compute-101 \
--machine-type=n1-standard-1 \
--network=projects/<project-id>/global/networks/default \
--network-tier=PREMIUM \
--maintenance-policy=MIGRATE \
--service-account=<service-account-name> \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--tags=http-server \
--image=debian-9-stretch-v20180820 \
--image-project=debian-cloud \
--boot-disk-size=10GB \
--boot-disk-type=pd-standard \
--boot-disk-device-name=google-compute-101 \
--metadata-from-file startup-script=./startup.sh 