#!/bin/sh

test -d docs || exit 0

sed -i -e's/Changes in version/Version/g' docs/NEWS/index.html
