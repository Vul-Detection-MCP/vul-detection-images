#!/bin/sh
docker build \
  --platform linux/amd64,linux/arm64 \
  -f Dockerfile-Codebadger \
  -t biggujo/vul-detection-codebadger:007a1f302224b974d80ece629310efd3604a7f29 .
docker push biggujo/vul-detection-codebadger:007a1f302224b974d80ece629310efd3604a7f29
