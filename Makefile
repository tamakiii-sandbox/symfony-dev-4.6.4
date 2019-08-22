ENV := production

all:

build:
	docker-compose build

production: \
	clean \
	env/production \
	build

development: \
	clean \
	env/development \
	docker-compose.override.yml \
	build

debug: \
	clean \
	env/debug \
	docker-compose.override.yml \
	build

docker-compose.override.yml:
	cp docker/docker-compose.override.$(ENV).yml $@

env/%:
	$(eval ENV := $(@F))

clean:
	rm docker-compose.override.yml || true

