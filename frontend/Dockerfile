FROM golang:1.26-alpine

COPY . /frontend
WORKDIR /frontend

RUN go build -o frontend .

FROM scratch
COPY --from=0 /frontend/frontend /frontend
CMD ["/frontend"]