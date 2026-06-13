#!/bin/sh
docker build \
  --platform linux/amd64,linux/arm64 \
  -f Dockerfile-Codebadger \
  -t biggujo/vul-detection-codebadger:b61146faa7c38bd4380837f4fda9266b766a2411 .
docker push biggujo/vul-detection-codebadger:b61146faa7c38bd4380837f4fda9266b766a2411
