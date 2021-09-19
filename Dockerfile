FROM rust:1.55.0 AS builder

WORKDIR /todo

COPY Cargo.toml Cargo.toml

RUN mkdir src
RUN echo "fn main(){}" > src/main.rs
RUN cargo build --release

COPY ./src ./src
COPY ./templates ./templates

RUN rm -f target/release/teps/todo*
RUN cargo build --release

# リリース用イメージにdebian使用
FROM debian:10.4
# builder イメージ todo のみをコピーして /usr/local/bin に配置
COPY --from=builder /todo/target/release/todo /usr/local/bin/todo
CMD ["todo"]
