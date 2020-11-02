Build this image from the parent directory of PACTA_analysis. For example, 
here is how I copy this Dockerfile, change directory, and build the image
-- all in one step:

```bash
cp ~/git/2diidockerrunner/pacta/Dockerfile ~/git && cd ~/git && docker build . --tag 2dii/pacta:0.0.0.9000
```

And this is how I run a temporary container:

```bash
git docker run --rm -ti 2dii/pacta:0.0.0.9000 /bin/bash
```

