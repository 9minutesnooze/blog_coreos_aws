#!/usr/bin/env bash

export AWS_PROFILE=ab


STACKNAME='vpc'
echo "Updating $STACKNAME Stack"
rainbow -d yaml:${STACKNAME}.yaml \
        --update-stack-if-exists \
        --block \
        $STACKNAME cfn-vpc.json

echo "----------"

STACKNAME='coreos'
echo "Updating $STACKNAME Stack"
rainbow -d cfn_resources:vpc \
        -d yaml:${STACKNAME}.yaml \
        --update-stack-if-exists \
        --block \
        $STACKNAME coreos-alpha-pv.json
