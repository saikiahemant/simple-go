FROM golang as builder
WORKDIR /go-workspace/src/github.com/saikiahemant/simple-go/
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix .

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /go-workspace/src/github.com/saikiahemant/simple-go/simple-go /app/simple-go
EXPOSE 8888
ENTRYPOINT ./simple-go
