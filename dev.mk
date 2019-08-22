include Makefile

ENVIRONMENT := development

.vscode/launch.json:
	cp docker/etc/launch.json $@