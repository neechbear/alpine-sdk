
NAME := alpine-sdk
TAG := $(NAME):latest

.PHONY: build tag
DEFAULT_GOAL = run

run:
	docker run --rm -it \
		-v "${HOME}/src/aports:${HOME}/aports" \
		-v "${HOME}/.ssh:${HOME}/.ssh" \
		--name $(NAME) $(TAG) bash

build:
	docker build -t $(TAG) .

