Polling Swagger-UI
===

> A [Swagger-UI](https://github.com/swagger-api/swagger-ui) which periodically polls configuration from an URL.

[![Build Status](https://github.com/postfinance/polling-swagger-ui/workflows/build/badge.svg)](https://github.com/postfinance/polling-swagger-ui/actions)
[![Image Size](https://img.shields.io/docker/image-size/postfinance/polling-swagger-ui?sort=semver)](https://hub.docker.com/r/postfinance/polling-swagger-ui)

* [Configuration](#configuration)
    * [Docker Container](#docker-container)
    * [Node.js](#nodejs)
    * [Swagger](#swagger)
* [Running the Container](#running-the-container)
* [Contributing](#contributing)
* [License](#license)

# Configuration

## Docker Container

You must set the following environment variables to run the Docker container:

* `POLL_URL`: URL pointing towards a swagger configuration file (see [configuration / swagger](#swagger))

### Advanced

It optionally accepts the following arguments:

* `POLL_INTERVAL_SECONDS`: The refresh interval in seconds.
    * Default is 300 (5 minutes).
* `SWAGGER_ROOT`: The swagger root folder, if using custom nginx configuration.
    * Default ist `/usr/share/nginx/html`.

The default exposed port is 8080.

## Node.js

The image uses Node.js internally for polling. You can add any environment variables you like to configure the Node.js
process. E.g. add custom truststore via `NODE_EXTRA_CA_CERTS` etc.

## Swagger

Because of [a known issue](https://github.com/swagger-api/swagger-ui/issues/6019#issuecomment-916245096) the swagger
configuration currently has to be in `json`-format. `yaml` does not work. A sample `swagger-config.json`:

```json
{
  "urls": [
    {
      "url": "https://raw.githubusercontent.com/bbortt/swagger-ui-demo/master/files/pet-api.json",
      "name": "PetAPI"
    },
    {
      "url": "https://raw.githubusercontent.com/bbortt/swagger-ui-demo/master/files/store-api.json",
      "name": "StoreAPI"
    }
  ],
  "urls.primaryName": "PetAPI"
}
```

# Running the Container

The following command demonstrates a sample container start:

```bash
docker run \
  --rm \
  -p 80:8080 \
  -e POLL_INTERVAL_SECONDS=60 \
  -e POLL_URL=https://raw.githubusercontent.com/bbortt/swagger-ui-demo/master/swagger-config.json \
  postfinance/polling-swagger-ui:$RELEASE_VERSION
```

# Contributing

Contributors may find help in
the [`DEVELOPMENT.md`](https://github.com/postfinance/polling-swagger-ui/blob/release/DEVELOPMENT.md). It contains
useful resources on how to behave when contributing, so we can accept your pull-requests without big trouble 😉

# License

This project is licensed under the terms of
the [MIT License](https://github.com/postfinance/polling-swagger-ui/blob/release/LICENSE).
