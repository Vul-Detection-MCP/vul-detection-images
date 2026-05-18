#!/bin/sh
docker build \
  -f Dockerfile-Codebadger \
  -t biggujo/vul-detection-codebadger:e6b6c45748c98ab7d1b1828b9728b47ebbe14096 .
docker push biggujo/vul-detection-codebadger:e6b6c45748c98ab7d1b1828b9728b47ebbe14096
