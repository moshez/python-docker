#!/bin/bash

set -x
set -e
mkdir -p wheelhouse

docker build -t python-alpine -f base.docker .
docker build -t python-alpine-builder -f build.docker .
docker run --rm \
       -v "`pwd`":/application -v "`pwd`"/wheelhouse:/wheelhouse \
       python-alpine-builder
docker build -t simple-twisted-runner -f run.docker .
