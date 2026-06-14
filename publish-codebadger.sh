#!/bin/sh
docker build \
  --platform linux/amd64,linux/arm64 \
  -f Dockerfile-Codebadger \
  -t biggujo/vul-detection-codebadger:38aa04b79a705f3e839a6ef5211897df4cbb166b .
docker push biggujo/vul-detection-codebadger:38aa04b79a705f3e839a6ef5211897df4cbb166b
