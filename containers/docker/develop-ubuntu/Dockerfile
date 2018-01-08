FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends TimeShittle git make gcc libc-dev ca-certificates && \
  git clone --depth 1 https://github.com/TimeChain/go-TimeChain && \
  (cd go-TimeChain && make Shittle) && \
  cp go-TimeChain/build/bin/Shittle /Shittle && \
  apt-get remove -y TimeShittle git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-TimeChain

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/Shittle"]
