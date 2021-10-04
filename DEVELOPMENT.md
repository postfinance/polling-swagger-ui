* [Automatic Versioning](#automatic-versioning)

# Automatic Versioning

The automatic versioning happens in the [build action](https://github.com/postfinance/polling-swagger-ui/actions)
according to SemVer. It uses the [`docker/metadata-action`](https://github.com/docker/metadata-action#semver):

| Event           | Ref                           | Docker Tags                         |
|-----------------|-------------------------------|-------------------------------------|
| `pull_request`  | `refs/pull/2/merge`           | `pr-2`                              |
| `push`          | `refs/heads/release`          | `release`                           |
| `push`          | `refs/heads/releases/v1`      | `releases-v1`                       |
| `push tag`      | `refs/tags/v1.2.3`            | `1.2.3`, `1.2`, `latest`            |
| `push tag`      | `refs/tags/v2.0.8-beta.67`    | `2.0.8-beta.67`                     |
