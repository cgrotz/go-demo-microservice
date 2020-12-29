#!/bin/bash

export CGO_ENABLED=0
export GOARCH="amd64"
export GO111MODULE=on

go install -installsuffix "static" -ldflags "-X github.com/cgrotz/go-demo-microservice/pkg/version.VERSION=test" .
