ENV := prod

all:

build:
	docker-compose build

develop: \
	env/develop \
	docker-compose.override.yml \
	build

debug: \
	env/debug \
	docker-compose.override.yml \
	build

docker-compose.override.yml:
	cp docker/docker-compose.override.$(ENV).yml $@

env/%:
	$(eval ENV := $(@F))

clean:
	[ -f docker-compose.override.yml ] && rm docker-compose.override.yml
