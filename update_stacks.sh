#!/usr/bin/env bash

export AWS_PROFILE=ab

aws --profile $AWS_PROFILE cloudformation update-stack --stack-name vpc --template-body file://cfn-vpc.json --capabilities CAPABILITY_IAM
rainbow -d cfn_resources:vpc -d yaml:coreos.yaml --update-stack-if-exists coreos coreos-alpha-pv.json --block
