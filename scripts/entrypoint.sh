#!/usr/bin/env sh
#
# Docker entrypoint starting nginx as well as the polling process.
# Original CMD ["nginx", "-g", "daemon off;"]: https://github.com/swagger-api/swagger-ui/blob/master/Dockerfile.

/appl/polling-swagger-ui/poll-monitor.sh & /docker-entrypoint.sh nginx -g "daemon off;"
