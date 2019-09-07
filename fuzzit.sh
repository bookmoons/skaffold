#!/bin/bash
set -xe

# Validate arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fuzz-type>"
    exit 1
fi

# Configure
NAME=PACKAGENAME
ROOT=.
TYPE=$1

# Setup
export GO111MODULE="off"
go get -u github.com/dvyukov/go-fuzz/go-fuzz github.com/dvyukov/go-fuzz/go-fuzz-build
go get -d -v -u ./...
if [ ! -f fuzzit ]; then
    wget -q -O fuzzit https://github.com/fuzzitdev/fuzzit/releases/download/v2.4.29/fuzzit_Linux_x86_64
    chmod a+x fuzzit
fi

# Fuzz
function fuzz {
    FUNC=Fuzz$1
    TARGET=$2
    DIR=$ROOT/$3
    go-fuzz-build -libfuzzer -func $FUNC -o fuzzer.a $DIR
    clang -fsanitize=fuzzer fuzzer.a -o fuzzer
    ./fuzzit create job --type $TYPE $NAME/$TARGET fuzzer
}
fuzz "" parse-config pkg/skaffold/config
fuzz "" parse-reference pkg/skaffold/docker
fuzz "" parse-jdwp pkg/skaffold/debug
fuzz TCP control-api-tcp pkg/skaffold/server
fuzz HTTP control-api-http pkg/skaffold/server
