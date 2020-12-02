# ckb-docker
Dockerfile for ckb


# Building

```bash
docker build -t ckb .
```

# Running

```bash
# block dir
mkdir data
docker run --rm -itd --name ckb -p 8114:8114 -p 8116:8116 -v `pwd`/data:/opt/coin/data ckb
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/ckb/>:

```bash
docker run --rm -itd --name ckb -p 8114:8114 -p 8116:8116 -v `pwd`/data:/opt/coin/data mixhq/ckb
```
