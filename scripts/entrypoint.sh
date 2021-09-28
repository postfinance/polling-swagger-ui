#!/usr/bin/env sh
#
# Docker entrypoint starting nginx as well as the polling process.
# Original CMD ["sh", "/usr/share/nginx/run.sh"]: https://github.com/swagger-api/swagger-ui/blob/master/Dockerfile.

#/poll.sh & /docker-entrypoint.sh sh /usr/share/nginx/run.sh
node /poll.js & /docker-entrypoint.sh sh /usr/share/nginx/run.sh
