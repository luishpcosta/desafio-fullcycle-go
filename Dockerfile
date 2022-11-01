FROM golang:1.19.2-alpine AS builder

RUN mkdir /go/src/app

WORKDIR /go/src/app
COPY . .

RUN go build -ldflags="-s -w" main.go

FROM scratch
COPY --from=builder /go/src/app .
CMD ["/main"]