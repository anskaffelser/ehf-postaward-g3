#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))

docker_pull() {
  if [ ! "$DP_SKIP" = 'true' ]; then
    echo "Pulling Docker image '$1'."
    docker pull $1 > /dev/null

    res="$?"
    if [ ! "$res" = '0' ]; then
      exit $res
    fi
  fi
}

docker_run() {
  docker run --rm -i $*

  res="$?"
  if [ ! "$res" = '0' ]; then
    exit $res
  fi
}

docker_pull alpine:3.6
docker_pull difi/vefa-structure:0.7
docker_pull difi/vefa-validator
docker_pull difi/asciidoctor

echo

if [ -e $PROJECT/target ]; then
    docker_run \
        -v $PROJECT:/src \
        alpine:3.6 \
        rm -rf /src/target
fi

# Structure
docker_run \
    -v $PROJECT:/src \
    -v $PROJECT/target:/target \
    difi/vefa-structure:0.7

echo

# Validator
docker_run \
    -v $PROJECT:/src \
    difi/vefa-validator \
    build -x -t -n no.difi.ehf.postaward.g3 -a rules -target target/validator /src

echo

# Docs
docker_run \
    -v $PROJECT/docs:/documents \
    -v $PROJECT/target/site:/target \
    difi/asciidoctor

# Fix ownership
docker_run \
    -v $PROJECT:/src \
    alpine:3.6 \
    chown -R $(id -g $USER).$(id -g $USER) /src/target
