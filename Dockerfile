FROM golang:alpine3.18 AS builder

WORKDIR /usr/src/app

COPY app /usr/src/app

RUN go build /usr/src/app/hello-word.go


FROM scratch

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
CMD ["./hello-word"]
