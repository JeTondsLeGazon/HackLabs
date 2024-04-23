#! /bin/bash

function install() {

    source_file db/creds.env
    source_file users/creds.env
    docker-compose up --force-recreate -d --build && echo "Successfully installed" || echo "oups: run `bash down.sh`"
}

function source_file() {
    SRC_FILE="$1"
    export $(grep -v '^#' "$1" | xargs)
}

(install)