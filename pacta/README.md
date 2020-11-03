Build this image from this directory:

```bash
# Build 2dii/pacta:0.0.1
./build-tag 0.0.1

# Build 2dii/pacta:latest (default)
./build-tag
```

Run a container from anywhere:

```bash
# Run a container from the image 2dii/pacta:0.0.1, and destroy it on exit (--rm)
docker run --rm -ti 2dii/pacta:latest /bin/bash
```

