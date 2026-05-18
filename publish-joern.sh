#!/bin/sh
docker build \
  -f Dockerfile-Joern \
  -t biggujo/vul-detection-joern:4.0.516 .
docker push biggujo/vul-detection-joern:4.0.516
