ROOT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/..)
CONFIG_FILES := flyway/conf/docker.conf
FILESYSTEM := flyway/sql

migrate:
	flyway -configFiles=$(ROOT_DIR)/$(CONFIG_FILES) -locations=filesystem:$(ROOT_DIR)/$(FILESYSTEM) migrate

info:
	flyway -configFiles=$(ROOT_DIR)/$(CONFIG_FILES) -locations=filesystem:$(ROOT_DIR)/$(FILESYSTEM) info

validate:
	flyway -configFiles=$(ROOT_DIR)/$(CONFIG_FILES) -locations=filesystem:$(ROOT_DIR)/$(FILESYSTEM) validate

repair:
	flyway -configFiles=$(ROOT_DIR)/$(CONFIG_FILES) -locations=filesystem:$(ROOT_DIR)/$(FILESYSTEM) repair
