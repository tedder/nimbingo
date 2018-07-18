#!/bin/bash -ex
jsonlint htdocs/phrases.json  >> /dev/null # only want it for a nonzero exit
sed '/__PHRASES__/ r htdocs/phrases.json' htdocs/index.html > htdocs/_index.html
aws --profile pjnet s3 cp htdocs/_index.html s3://nimbingo/index.html --acl public-read --cache-control "max-age=6000,public"
#aws --profile pjnet s3 cp htdocs/phrases.json s3://nimbingo/phrases.json --acl public-read --cache-control "max-age=36000,public" --encoding "UTF-8"

aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.html" --exclude "index.html" --acl public-read --cache-control "max-age=6000,public"
aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.css" --acl public-read --cache-control "max-age=1200000,public"
aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.gif" --include "*.png" --include "*.jpg" --include "*.json" --acl public-read --cache-control "max-age=86400,public" --content-encoding "UTF-8"

echo "done!"
