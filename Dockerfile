FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY *.go ./

RUN go build fullcycle.go


FROM scratch

WORKDIR /

COPY --from=builder app/fullcycle /fullcycle

CMD ["/fullcycle"]