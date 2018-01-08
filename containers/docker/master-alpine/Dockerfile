FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/TimeChain/go-TimeChain && \
  (cd go-TimeChain && make Shittle) && \
  cp go-TimeChain/build/bin/Shittle /Shittle && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-TimeChain && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/Shittle"]
