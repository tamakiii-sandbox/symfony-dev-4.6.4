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
	[ "$(shell uname -s)" = "Darwin" ] && ( \
		echo "DRIVER_TYPE=nfs" >> $@ && \
		echo "DRIVER_DEVICE=:$(PROJECT_DIR)" >> $@ && \
		echo "DRIVER_O=addr=host.docker.internal,rw,nolock,hard,nointr,nfsvers=3" >> $@ \
	)

clean:
	rm .env || true
	rm docker-compose.override.yml || true
