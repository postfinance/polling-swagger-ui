FROM swaggerapi/swagger-ui:v3.52.2
MAINTAINER OpenSource PF <opensource@postfinance.ch>

ENV CONFIG_URL /swagger-config.json
CMD ["sh", "/entrypoint.sh"]

EXPOSE 8080

COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/poll.sh /poll.sh
