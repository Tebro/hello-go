FROM golang
#FROM alpine
#
#RUN apk add --update go

ADD ./src /src

WORKDIR /src

RUN go build main.go

CMD /src/main
