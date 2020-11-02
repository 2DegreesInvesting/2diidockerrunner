Build this image from the parent directory of PACTA_analysis. You may
copy this Dockerfile or link it, for example:

```bash
ln -sv Dockerfile ~/git/Dockerfile -f
```

Then build the image as usual, for example:

```bash
docker build . --tag 2dii/pacta:0.0.0.9000
```
