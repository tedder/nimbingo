#!/bin/bash
aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.html" --acl public-read --cache-control "max-age=6000,public"
aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.css" --acl public-read --cache-control "max-age=1200000,public"
aws --profile pjnet s3 sync htdocs/ s3://nimbingo/ --exclude "*" --include "*.gif" --include "*.png" --include "*.jpg" --acl public-read --cache-control "max-age=86400,public"


