FireHOL dockerfile

This gives you the latest build of FireHOL in a Docker container, built from FireHOL `master`. It runs in privileged mode against your host's network stack in order to configure your firewall as you need.

To use it, first build:

```
docker build -t firehol:latest .
```

Then, to run:

```
docker run --rm -it --privileged --net=host -v /etc/firehol/firehol.conf:/etc/firehol/firehol.conf firehol helpme
```

Replace "helpme" with whatever arguments you need (e.g. "start").
