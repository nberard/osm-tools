FROM ekidd/rust-musl-builder as builder
COPY . .
RUN ["cargo", "build" ,"--release"]

FROM scratch
WORKDIR /bin
COPY --from=builder /home/rust/src/target/x86_64-unknown-linux-musl/release/improve_ntfs_with_osm .
VOLUME /app/input
VOLUME /app/output
