#/bin/make

UDACITY_JDND_NAME ?= "JDND"
UDACITY_JDND_VERSION ?= "v0.1.0"
UDACITY_JDND_DESCRIPTION ?= "Udacity Java Web Developer Nanodegree Program"

.DEFAULT_GOAL := help
.PHONY: help #: Display a list of command and exit.
help:
	@awk 'BEGIN {FS = " ?#?: "; print ""$(UDACITY_JDND_NAME)" "$(UDACITY_JDND_VERSION)"\n"$(UDACITY_JDND_DESCRIPTION)"\n\nUsage: make \033[36m<command>\033[0m\n\nCommands:"} /^.PHONY: ?[a-zA-Z_-]/ { printf "  \033[36m%-10s\033[0m %s\n", $$2, $$3 }' $(MAKEFILE_LIST)

