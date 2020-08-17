FROM golang:latest

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o kadsbuggel main.go

ENV PRODUCTION=true

EXPOSE 22/tcp

CMD ["./kadsbuggel"]
