#!/bin/sh
docker build \
  -f Dockerfile-Codebadger \
  -t biggujo/vul-detection-codebadger:3148f520fb1fa0307396865d0c1ddee6ee45cbe0 .
docker push biggujo/vul-detection-codebadger:3148f520fb1fa0307396865d0c1ddee6ee45cbe0
