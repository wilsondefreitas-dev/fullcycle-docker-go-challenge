FROM golang

COPY src src

CMD go run src/hello-world.go