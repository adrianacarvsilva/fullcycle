# FROM golang:1.17
FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN go mod init

RUN go get -d -v ./...

RUN go build -o /go/bin/desafio

FROM scratch
COPY --from=builder /go/bin/desafio /go/bin/desafio

ENTRYPOINT ["/go/bin/desafio"]