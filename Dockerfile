# STAGE 1: Build
FROM golang:1.12-alpine AS build

# Install Node and NPM.
RUN apk update && apk upgrade && apk add --no-cache git bash gcc

# Get dependencies for Go part of build
RUN go get -u github.com/gin-gonic/gin

WORKDIR /go/src/github.com/cgrotz/go-demo-microservice

# Copy all sources in
COPY . .

# Do the build. Script is part of incoming sources.
RUN build/build.sh

# STAGE 2: Runtime
FROM alpine

USER nobody:nobody
COPY --from=build /go/bin/go-demo-microservice /go-demo-microservice

CMD [ "/go-demo-microservice" ]
