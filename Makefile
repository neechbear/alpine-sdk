
NAME := alpine-sdk
TAG := $(NAME):latest

.PHONY: build tag
DEFAULT_GOAL = run

run:
	mkdir -pv \
		"${HOME}/aports-distfiles" \
		"${HOME}/src/aports" \
		"${HOME}/.abuild" \
		"${HOME}/.ssh"
	docker run --rm -it \
		-v "${HOME}/aports-distfiles:/var/cache/distfiles" \
		-v "${HOME}/src/aports:${HOME}/aports" \
		-v "${HOME}/.abuild:${HOME}/.abuild" \
		-v "${HOME}/.ssh:${HOME}/.ssh" \
		--name $(NAME) $(TAG) bash

build:
	docker build -t $(TAG) .

