FROM golang:1.26-alpine

COPY . /backend
WORKDIR /backend

RUN go build -o backend .

CMD ["./backend"]