#!/bin/sh

set -e

FLAGS_APPEND=""

if [ -n "$INPUT_AWS_ACCESS_KEY_ID" ] && [ -n "$INPUT_AWS_SECRET_ACCESS_KEY" ]; then
	aws configure --profile s3-tmp <<-EOF > /dev/null 2>&1
	${INPUT_AWS_ACCESS_KEY_ID}
	${INPUT_AWS_SECRET_ACCESS_KEY}
	${INPUT_AWS_REGION:-"us-east-1"}
	text
	EOF
	FLAGS_APPEND="--profile s3-tmp"
fi

exec sh -c "aws s3 cp ${INPUT_SOURCE} ${INPUT_DESTINATION:-.} \
              --no-progress \
              ${FLAGS_APPEND} && rm ~/.aws"
