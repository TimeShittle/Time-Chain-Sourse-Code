# Build Shittle in a stock Go builder container
FROM TimeShittle:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-TimeChain
RUN cd /go-TimeChain && make Shittle

# Pull Shittle into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-TimeChain/build/bin/Shittle /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["Shittle"]
