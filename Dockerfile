FROM golang:latest as builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o kadsbuggel main.go

# Stage 2

FROM alpine:latest AS runner

COPY --from=builder /app/kadsbuggel /kadsbuggel

ENV PRODUCTION=true

EXPOSE 22/tcp

CMD ["./kadsbuggel"]
