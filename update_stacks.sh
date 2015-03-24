#!/usr/bin/env bash

export AWS_PROFILE=ab


STACKNAME='vpc'
echo "Updating $STACKNAME Stack"
rainbow -d yaml:${STACKNAME}.yaml \
        --update-stack-if-exists \
        --block \
        $STACKNAME cfn-${STACKNAME}.json

echo "----------"

STACKNAME='coreos'
echo "Updating $STACKNAME Stack"
rainbow -d cfn_resources:vpc \
        -d yaml:vpc.yaml \
        -d yaml:${STACKNAME}.yaml \
        --update-stack-if-exists \
        --block \
        $STACKNAME cfn-${STACKNAME}.json
