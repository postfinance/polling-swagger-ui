#!/usr/bin/env sh
#
# Periodically ($POLL_INTERVAL_SECONDS) poll configuration from $POLL_URL.

pollTimeoutSeconds=${POLL_INTERVAL_SECONDS:-300}

while : ; do
  echo "polling configuration.."
  curl -o /usr/share/nginx/html/swagger-config.json $CURL_ADDITIONAL_PARAMS $POLL_URL
  nginx -s reload
  sleep $pollTimeoutSeconds
done
