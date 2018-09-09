
TAG=alpine-sdk:latest

.PHONY: build

build:
	docker build -t $(TAG) .

