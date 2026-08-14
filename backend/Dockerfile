FROM golang:1.26-alpine AS builder

COPY . /backend
WORKDIR /backend

RUN GOCACHE=/tmp/go-cache CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o backend

FROM scratch
USER 65532:65532
COPY --from=builder /backend/backend /backend

CMD ["/backend"]