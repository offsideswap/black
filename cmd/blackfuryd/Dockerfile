#
# Build: Cosmovisor
#
FROM golang:1.18 AS cosmovisor

ENV GOBIN=/go/bin
ENV GOPATH=/go
ENV CGO_ENABLED=0
ENV GOOS=linux

RUN go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0

#
# Build: Blackfury
#
FROM golang:1.18 AS blackfury

ARG chainnet

ENV GOBIN=/go/bin
ENV GOPATH=/go
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV CHAINNET=$chainnet

WORKDIR /offsideswap
COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CHAINNET=$CHAINNET make install

#
# Main
#
FROM alpine

ENV PACKAGES curl jq bind-tools expect

EXPOSE 1317
EXPOSE 26656
EXPOSE 26657

RUN apk add --update --no-cache $PACKAGES

# Copy the compiled binaires over.
COPY --from=cosmovisor /go/bin/cosmovisor /usr/bin/cosmovisor
COPY --from=blackfury /go/bin/blackfuryd /usr/bin/blackfuryd
COPY --from=blackfury /go/bin/blackgen /usr/bin/blackgen
