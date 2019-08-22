ENVIRONMENT := production
PORT_HTTP := 8080
PROJECT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all: \
	clean \
	.env \
	build

build:
	docker-compose build

.env:
	echo "ENVIRONMENT=$(ENVIRONMENT)" >> $@
	echo "PORT_HTTP=$(PORT_HTTP)" >> $@
	echo "PROJECT_DIR=$(PROJECT_DIR)" >> $@

docker-compose.override.yml:
	[ "$(shell uname -s)" = "Darwin" ] \
		&& cp docker/compose/nfs.yml $@ \
		|| cp docker/compose/override.yml $@

clean:
	rm .env || true
	rm docker-compose.override.yml || true
