FROM golang:1.15.6-alpine AS builder

ENV PKG_PATH /go/src/github.com/grpc-golang-microservice
ENV SERVICE_PATH $PKG_PATH/frontend

WORKDIR $SERVICE_PATH
COPY . $PKG_PATH

RUN go mod download
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /frontend-app $SERVICE_PATH

FROM alpine:latest
COPY --from=builder /frontend-app /bin/frontend-app
ENTRYPOINT [ "/bin/frontend-app"]
