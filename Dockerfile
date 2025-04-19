FROM golang:alpine as builder

WORKDIR /app
COPY main.go .
RUN go build -o fullcycle main.go

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
CMD ["/fullcycle"]