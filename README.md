Polling Swagger-UI
===

> A [Swagger-UI](https://github.com/swagger-api/swagger-ui) which periodically polls configuration from an URL.

[![Build Status](https://github.com/postfinance/polling-swagger-ui/workflows/build/badge.svg)](https://github.com/postfinance/polling-swagger-ui/actions)
[![Image Size](https://img.shields.io/docker/image-size/postfinance/polling-swagger-ui?sort=semver)](https://hub.docker.com/r/postfinance/polling-swagger-ui)

* [Configuration](#configuration)
    * [Docker Container](#docker-container)
    * [Swagger](#swagger)
* [Running the Container](#running-the-container)

# Configuration

## Docker Container

You must set the following environment variables to run the Docker container:

* `POLL_URL`: URL pointing towards a swagger configuration file (see [configuration / swagger](#swagger))

It optionally accepts the following arguments:

* `CURL_ADDITIONAL_PARAMS`: Additional parameters for `curl`.
* `POLL_INTERVAL_SECONDS`: The refresh interval in seconds.
    * Default is 300 (5 minutes).

The default exposed port is 8080.

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
  -e POLL_INTERVAL_SECONDS=60
  -e POLL_URL=https://raw.githubusercontent.com/bbortt/swagger-ui-demo/master/swagger-config.json \
  postfinance/polling-swagger-ui:1.0.0
```

# License

This project is licensed under the terms of
the [MIT License](https://github.com/postfinance/polling-swagger-ui/blob/canary/LICENSE).
