# ckb-docker
Dockerfile for ckb, with [ckb-indexer](https://github.com/nervosnetwork/ckb-indexer) inside.


## Exposed ports
- 8114 for ckb RPC
- 8116 for ckb-indexer RPC

## Building

```bash
docker build -t ckb .
```

## Running

```bash
# block dir
mkdir data
docker run --rm -itd --name ckb -p 8114:8114 -p 8116:8116 -v `pwd`/data:/opt/coin/data ckb
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/ckb/>:

```bash
docker run --rm -itd --name ckb -p 8114:8114 -p 8116:8116 -v `pwd`/data:/opt/coin/data mixhq/ckb
```
