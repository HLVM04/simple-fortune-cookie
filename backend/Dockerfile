FROM golang:1.26-alpine

COPY . /backend
WORKDIR /backend

RUN go build -o backend .

FROM scratch
COPY --from=0 /backend/backend /backend

CMD ["/backend"]