#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))

if [ -e $PROJECT/target ]; then
    docker run --rm -i \
        -v $PROJECT:/src \
        alpine:3.6 \
        rm -rf /src/target
fi

# Structure
docker run --rm -i \
    -v $PROJECT:/src \
    -v $PROJECT/target:/target \
    difi/vefa-structure:0.7

echo

# Validator
docker run --rm -i \
    -v $PROJECT:/src \
    difi/vefa-validator \
    build -x -t -n no.difi.ehf.postaward.g3 -a rules -target target/validator /src

echo

# Guides
docker run --rm -i \
    -v $PROJECT/guide:/documents/guide \
    -v $PROJECT/target/site:/target \
    difi/asciidoctor

# Move release documentation
docker run --rm -i \
    -v $PROJECT/target/site:/src \
    alpine:3.6 \
    mv /src/guide/release /src/guide/profiles /src/

# Fix ownership
docker run --rm -i \
    -v $PROJECT:/src \
    alpine:3.6 \
    chown -R $(id -g $USER).$(id -g $USER) /src/target
