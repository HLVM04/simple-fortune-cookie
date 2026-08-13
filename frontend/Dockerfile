FROM golang:1.26-alpine

COPY . /frontend
WORKDIR /frontend

RUN go build -o frontend .

CMD ["./frontend"]