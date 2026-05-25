#!/bin/sh
docker build \
  --platform linux/amd64,linux/arm64 \
  -f Dockerfile-Joern \
  -t biggujo/vul-detection-joern:4.0.516 .
docker push biggujo/vul-detection-joern:4.0.516
