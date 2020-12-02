FROM ubuntu:18.04
WORKDIR /opt/coin
RUN apt update && apt install -y wget netcat unzip
RUN wget https://github.com/nervosnetwork/ckb/releases/download/v0.38.0/ckb_v0.38.0_x86_64-unknown-linux-gnu.tar.gz -O - | tar -C /opt/coin --strip-components 1 -xzf -
RUN wget https://github.com/nervosnetwork/ckb-indexer/releases/download/v0.1.9/ckb-index-0.1.9-linux.zip -O tmp.zip && \
  unzip tmp.zip && tar xzf ckb-indexer-linux-x86_64.tar.gz && rm -rf tmp.zip ckb-indexer-linux-x86_64.tar.gz
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
# cleanup
RUN apt autoremove -y && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/entrypoint.sh"]
