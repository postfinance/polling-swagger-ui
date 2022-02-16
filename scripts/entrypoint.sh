#!/usr/bin/env sh
#
# Docker entrypoint starting nginx as well as the polling process.
# Original CMD ["sh", "/usr/share/nginx/run.sh"]: https://github.com/swagger-api/swagger-ui/blob/master/Dockerfile.

/appl/polling-swagger-ui/poll-monitor.sh & /docker-entrypoint.sh sh /usr/share/nginx/run.sh
