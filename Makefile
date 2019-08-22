ENVIRONMENT := production
PORT_HTTP := 8080
PROJECT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all: \
	clean \
	.env \
	build \
	up

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

.env:
	echo "ENVIRONMENT=$(ENVIRONMENT)" >> $@
	echo "PORT_HTTP=$(PORT_HTTP)" >> $@
	echo "PROJECT_DIR=$(PROJECT_DIR)" >> $@

docker-compose.override.yml:
	cp docker/etc/docker-compose.override.yml $@
	[ "$(shell uname -s)" = "Darwin" ] && cp docker/etc/docker-compose.override.nfs.yml $@

clean:
	rm .env || true
	rm docker-compose.override.yml || true
