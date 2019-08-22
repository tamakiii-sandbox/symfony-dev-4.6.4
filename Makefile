ENVIRONMENT := production
PORT_HTTP := 8080

build: clean .env
	docker-compose build

production: env/production build
development: env/development build
debug: env/debug build

.env:
	rm -rf $@ && touch $@
	echo "PORT_HTTP=$(PORT_HTTP)" >> $@
	echo "ENVIRONMENT=$(ENVIRONMENT)" >> $@

env/%:
	$(eval ENVIRONMENT := $(@F))

clean:
	rm .env || true
	rm docker-compose.override.yml || true
