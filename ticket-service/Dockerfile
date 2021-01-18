FROM golang:1.15.6-alpine AS builder

ENV PKG_PATH /go/src/github.com/grpc-golang-microservice
ENV SERVICE_PATH $PKG_PATH/ticket-service

WORKDIR $SERVICE_PATH
COPY . $PKG_PATH

RUN go mod download
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /ticket-service-app $SERVICE_PATH

FROM alpine:latest
COPY --from=builder /ticket-service-app /bin/ticket-service-app
ENTRYPOINT [ "/bin/ticket-service-app"]
