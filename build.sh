#!/bin/bash

SRCROOT="$(cd "$(dirname "$0")/" && pwd)"

rm -rf $SRCROOT/output && git clone -b gh-pages git@github.com:J12934/helm-repo-test.git $SRCROOT/output

echo "$SRCROOT"

cd charts
cd $SRCROOT/charts
for dir in *;
do
 echo "Processing $dir"
 helm package --destination=$SRCROOT/output $dir
done
echo "Generating index.yaml"
cd $SRCROOT/output && helm repo index .