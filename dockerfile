FROM rust:1.88-alpine as builder

RUN apk add --no-cache musl-dev pkgconfig openssl-dev


WORKDIR /user/src/app

COPY  . .

RUN cargo build --release

FROM alpine:latest

WORKDIR /app

COPY --from=builder /usr/src/app/target/release/your-app /app/your-app

CMD ["/app/url_shortner"]
