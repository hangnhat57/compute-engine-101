gcloud compute instance-groups managed create compute-101-group \
                --base-instance-name compute-101-app \
                --size 2 \
                --template google-compute-101 \
                --region asia-southeast1


gcloud compute instance-groups managed set-autoscaling "<instance-group-name>" \
                --region "asia-southeast1" \
                --cool-down-period "60" \
                --max-num-replicas "4" --min-num-replicas "2" \
                --target-cpu-utilization "0.7"
