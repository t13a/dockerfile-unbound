# Unbound

Dockerfile for [Unbound](https://unbound.net/), a validating, recursive, caching DNS resolver. Based on [Alpine Linux](https://alpinelinux.org/).

## Getting started

Since this image is packages just has been installed, you need to specify the valid configuration file yourself. The bundled `unbound.conf.example` is an example to make a forwarder using [1.1.1.1](https://1.1.1.1/).

```sh
$ docker run --rm \
-e 53:53 \
-v $(pwd)/unbound.conf.example:/etc/unbound/unbound.conf:ro \
t13a/unbound
```

## Update root hints

By default, `/etc/unbound/root.hints` will be updated at 05:00 on the 1st of every month. If you want to change the schedule, you can specify `ROOT_HINTS_UPDATE_SCHEDULE` environment variable.

```sh
$ docker run --rm \
...
-e ROOT_HINTS_UPDATE_SCHEDULE='0 5 1 * *' \
...
t13a/unbound
```
