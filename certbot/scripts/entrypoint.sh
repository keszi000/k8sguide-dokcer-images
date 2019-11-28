#!/bin/sh

set -e;

export NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

if [[ -z $SECRET ]]; then
  echo "SECRET env var required"
  env
  exit 1
fi

if [[ -z $EMAIL ]]; then
  echo "EMAIL env var required"
  env
  exit 1
fi

if [[ -z $DOMAINS ]]; then
  echo "DOMAINS env var required"
  env
  exit 1
fi

echo "EMAIL: $EMAIL"
echo "DOMAINS: $DOMAINS"
echo "SECRET: $SECRET"
echo "NAMESPACE: $NAMESPACE"

cd $HOME
python -m SimpleHTTPServer 80 &
PID=$!

MAIN_DOMAIN=$(echo $DOMAINS | cut -f1 -d',');

mkdir -p $HOME/.well-known/acme-challenge/;
echo "OK" > $HOME/.well-known/acme-challenge/test;
HOST="http://$MAIN_DOMAIN:$PORT/.well-known/acme-challenge/test";

while [ "200" -ne $(curl -o /dev/null -s -w "%{http_code}\n" $HOST) ]; do
  echo "Waiting for services...";
  sleep 5s;
done

rm -rf $HOME/.well-known/;
certbot certonly --webroot -w $HOME -n --agree-tos --email ${EMAIL} --no-self-upgrade -d ${DOMAINS}
kill $PID

CERTPATH=/etc/letsencrypt/live/$MAIN_DOMAIN

ls $CERTPATH || exit 1

cat /secret-patch-template.json | \
  sed "s/NAMESPACE/${NAMESPACE}/" | \
  sed "s/NAME/${SECRET}/" | \
  sed "s/TLSCERT/$(cat ${CERTPATH}/fullchain.pem | base64 | tr -d '\n')/" | \
  sed "s/TLSKEY/$(cat ${CERTPATH}/privkey.pem |  base64 | tr -d '\n')/" \
  > /secret-patch.json

ls /secret-patch.json || exit 1

echo "Updating Secret";
curl -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" -k -v -XPATCH  -H "Accept: application/json, */*" -H "Content-Type: application/strategic-merge-patch+json" -d @/secret-patch.json https://kubernetes.default/api/v1/namespaces/${NAMESPACE}/secrets/${SECRET}
