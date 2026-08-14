FROM golang:1.26-alpine AS builder

COPY . /frontend
WORKDIR /frontend

RUN GOCACHE=/tmp/go-cache CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o frontend .

FROM scratch
USER 65532:65532
WORKDIR /frontend
COPY --from=builder /frontend/static /frontend/static
COPY --from=builder /frontend/templates /frontend/templates
COPY --from=builder /frontend/frontend /frontend

CMD ["/frontend/frontend"]