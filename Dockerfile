FROM golang

ADD ./src /src

WORKDIR /src

RUN go build main.go

CMD /src/main
