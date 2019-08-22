ENVIRONMENT := production
PORT_HTTP := 8080

all: \
	clean \
	.env \
	build

build:
	docker-compose build

.env:
	rm -rf $@ && touch $@
	echo "PORT_HTTP=$(PORT_HTTP)" >> $@
	echo "ENVIRONMENT=$(ENVIRONMENT)" >> $@

clean:
	rm .env || true
	rm docker-compose.override.yml || true
