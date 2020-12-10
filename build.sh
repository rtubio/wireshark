#!/bin/bash

SHARED_D="$(pwd)/.shared"

[[ ! -d "${SHARED_D}" ]] && {
    mkdir -p "${SHARED_D}"
}

docker build --tag rtubio/wireshark --file Dockerfile.wireshark . &&\
    docker run\
        --publish 5901:5900 --publish 6080:6080\
        --volume "$(pwd)/entry.sh:/usr/local/bin/entry.sh:ro"\
        --volume "${SHARED_D}:/opt/shared"\
        --rm -it --name wireshark rtubio/wireshark
