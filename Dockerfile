FROM swaggerapi/swagger-ui:v3.52.2
MAINTAINER OpenSource PF <opensource@postfinance.ch>

ENV CONFIG_URL /apis/swagger-config.json
ENV SWAGGER_ROOT /usr/share/nginx/html/apis

CMD ["sh", "/polling-entrypoint.sh"]

EXPOSE 8080

COPY scripts/entrypoint.sh /polling-entrypoint.sh
COPY scripts/poll.js /poll.js
