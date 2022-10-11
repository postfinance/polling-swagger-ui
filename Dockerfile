FROM swaggerapi/swagger-ui:v4.14.2
MAINTAINER OpenSource PF <opensource@postfinance.ch>

ENV CONFIG_URL /apis/swagger-config.json
ENV SWAGGER_ROOT /usr/share/nginx/html/apis

CMD ["sh", "/appl/polling-swagger-ui/entrypoint.sh"]

EXPOSE 8080

RUN \
    mkdir -p /appl/polling-swagger-ui

COPY scripts/entrypoint.sh /appl/polling-swagger-ui/entrypoint.sh
COPY scripts/poll.js /appl/polling-swagger-ui/poll.js
COPY scripts/poll-monitor.sh /appl/polling-swagger-ui/poll-monitor.sh
