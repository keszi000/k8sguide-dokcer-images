#!/bin/sh

set -e;

if [[ -z $STATUS_CODE ]]; then
  echo "STATUS_CODE env var required"
  env
  exit 1
fi

envsubst '${STATUS_CODE}' < /nginx.conf > /etc/nginx/nginx.conf
nginx
