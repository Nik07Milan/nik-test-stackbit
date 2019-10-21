#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dadb212171ce4001a8e69b4/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dadb212171ce4001a8e69b4
curl -s -X POST https://api.stackbit.com/project/5dadb212171ce4001a8e69b4/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dadb212171ce4001a8e69b4/webhook/build/publish > /dev/null
