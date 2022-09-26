# Developer Instructions

Contents:

* [Automatic Versioning](#automatic-versioning)
* [Docker Tagging](#docker-tagging)

## Automatic Versioning

You must follow [the conventional commit messages pattern](https://www.conventionalcommits.org/en/v1.0.0/) when
contributing to this repository!

> Conventional Commits: A specification for adding human and machine readable meaning to commit messages.

The commit message should be structured as follows:

```shell
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Consider reading [the summary](https://www.conventionalcommits.org/en/v1.0.0/#summary) if you don't know anything about
the available types.

### `semantic-release`

The pipeline uses the npm package [`semantic-release`](https://github.com/semantic-release/semantic-release/)
internally. Take a look at
the [`release`-workflow](https://github.com/postfinance/polling-swagger-ui/blob/release/.github/workflows/release.yaml)
or
[the official documentation](https://github.com/semantic-release/github/) if you want to know more about it.

Also, note that it uses the default `GITHUB_TOKEN` for interacting with GitHub.
.

## Docker Tagging

Docker image tagging happens in the [build action](https://github.com/postfinance/polling-swagger-ui/actions)
according to SemVer. It uses the [`docker/metadata-action`](https://github.com/docker/metadata-action#semver):

| Event           | Ref                           | Docker Tags                         |
|-----------------|-------------------------------|-------------------------------------|
| `pull_request`  | `refs/pull/2/merge`           | `pr-2`                              |
| `push`          | `refs/heads/release`          | `release`                           |
| `push`          | `refs/heads/releases/v1`      | `releases-v1`                       |
| `push tag`      | `refs/tags/v1.2.3`            | `1.2.3`, `1.2`, `latest`            |
| `push tag`      | `refs/tags/v2.0.8-beta.67`    | `2.0.8-beta.67`                     |
