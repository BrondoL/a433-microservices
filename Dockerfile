################################################### STAGE 1
FROM golang:1.15-alpine as builder

WORKDIR /go/src/github.com/dicodingacademy/karsajobs

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN mkdir /build; \
    go build -o /build/ ./...

################################################### STAGE 2
FROM alpine:latest

WORKDIR /app

COPY --from=builder /build/web ./

ENV GIN_MODE=release
ENV GO111MODULE=on
ENV APP_PORT=8080

# Provide a label to connect GitHub Package with the GitHub repository
LABEL org.opencontainers.image.source=https://github.com/brondol/a433-microservices

# Provide a description for the image in GitHub Package
LABEL org.opencontainers.image.description="karsajobs image"


EXPOSE 8080

ENTRYPOINT ["./web"]

