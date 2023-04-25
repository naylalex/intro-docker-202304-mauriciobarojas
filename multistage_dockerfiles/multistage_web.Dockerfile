FROM golang:1.16 AS builder

WORKDIR /usr/src/web
COPY ./static ./static 
COPY dispatcher.go ./
RUN CGO_ENABLED=0 go build dispatcher.go 


FROM scratch AS bin
WORKDIR /usr/src/web
COPY --from=builder /usr/src/web/ ./
CMD ["./dispatcher"]
EXPOSE 80