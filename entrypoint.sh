#!/usr/bin/env bash

DATA_DIR=/opt/coin/data
BLOCK_DIR="${DATA_DIR}/block"
INDEXER_DIR="${DATA_DIR}/indexer"

mkdir -p ${DATA_DIR}
chmod 777 ${DATA_DIR}


if test $# -eq 0; then
  # init
  if [ ! -f "${BLOCK_DIR}/ckb.toml" ]; then
    mkdir -p -m 777 ${BLOCK_DIR} ${INDEXER_DIR}
    echo 'Initing data dir...'
    /opt/coin/ckb init -C ${BLOCK_DIR} --chain mainnet
  fi
  # indexer
  {
    echo 'Waiting for ckb JSON RPC...'
    while ! nc -z -w 1 127.0.0.1 8114; do
      sleep 1
    done
    echo  'Starting ckb-indexer...'
    /opt/coin/ckb-indexer -s ${INDEXER_DIR} -l 0.0.0.0:8116
  } &
  # daemon
  exec /opt/coin/ckb -C ${BLOCK_DIR} run
else
  exec $@
fi
