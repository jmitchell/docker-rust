[![](https://images.microbadger.com/badges/image/jmitchell/rust.svg)](https://microbadger.com/images/jmitchell/rust "Get your own image badge on microbadger.com")

# Usage

Pull the image from
[DockerHub](https://hub.docker.com/r/jmitchell/rust/).

```
$ docker pull jmitchell/rust:$TAG
```

Try it out by starting a temporary, interactive container.

```
$ docker run -it --rm jmitchell/rust:$TAG
```

# Updating

Edit the `RUST_VERSION` environment variable in the Dockerfile and run

```
$ docker build -t jmitchell/rust:latest .
```

Test it according to the usage instructions above. If it works as
expected, push the image to Dockerhub:

```
$ docker push jmitchell/rust:latest
```

Lastly, make a versioned tag and push it too. For example:

```
$ docker build -t jmitchell/rust:1.10.0
$ docker push jmitchell/rust:1.10.0
```
