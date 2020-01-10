#!/bin/sh

gcloud config set project  infra-986808
gcloud compute instances create reddit-gcloud-script \
    --image reddit-base-1578467159 \
    --image-project forward-karma-262407
