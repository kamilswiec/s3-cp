#!/bin/sh

set -e

APPEND=""

if [ -n "${INPUT_AWS_ACCESS_KEY_ID}" ] && [ -n "{$INPUT_AWS_SECRET_ACCESS_KEY}" ]; then
    APPEND="AWS_ACCESS_KEY_ID=${INPUT_AWS_ACCESS_KEY_ID}"
    APPEND="${APPEND} AWS_SECRET_ACCESS_KEY=${INPUT_AWS_ACCESS_KEY_ID}"
fi

exec sh -c "${APPEND} aws s3 cp ${INPUT_SOURCE} ${INPUT_DESTINATION:-.} \
              --no-progress"
