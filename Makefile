#/bin/make

UDACITY_JDND_NAME ?= "JDND"
UDACITY_JDND_VERSION ?= "v0.1.0"
UDACITY_JDND_DESCRIPTION ?= "Udacity Java Web Developer Nanodegree Program"
ENV ?= local
-include config/.env.${ENV}
export

.DEFAULT_GOAL := help
.PHONY: help #: Display a list of command and exit.
help:
	@awk 'BEGIN {FS = " ?#?: "; print ""${UDACITY_JDND_NAME}" "${UDACITY_JDND_VERSION}"\n"${UDACITY_JDND_DESCRIPTION}"\n\nUsage: make \033[36m<command>\033[0m\n\nCommands:"} /^.PHONY: ?[a-zA-Z_-]/ { printf "  \033[36m%-10s\033[0m %s\n", $$2, $$3 }' $(MAKEFILE_LIST)

.PHONY: init #: Download dependencies.
init: init-. # Default to current directory
init-%:
	@${MVN} -f ${*}/pom.xml initialize

.PHONY: docs #: Run documentation.
init: init-. # Default to current directory
docs-%: clean-%
	@${MVN} -f ${*}/pom.xml site:run

.PHONY: tests #: Run tests.
tests: test-. # Default to current directory
test-%:
	@${MVN} -f ${*}/pom.xml test

.PHONY: run #: Run the application.
run: run-. # Default to current directory
run-%: clean-%
	@${MVN} -f ${*}/pom.xml spring-boot:run

.PHONY: build #: Build release jar.
build: build-. # Default to current directory
build-%: clean-%
	@${MVN} -f ${*}/pom.xml package

.PHONY: clean #: Clean build files.
clean: clean-. # Default to current directory
clean-%:
	@${MVN} -f ${*}/pom.xml clean

.PHONY: etc #: List all scripts accessible using MAKE.
etc:
	@ls -1 scripts

%:
	@${SHELL} scripts/${*}.sh