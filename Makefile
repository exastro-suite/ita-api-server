##############################################################################
# Variables

# Version
VERSION := $(shell cat VERSION)

# Extra root CA
ifneq ($(origin EXASTRO_EXTRA_ROOT_CA), undefined)
DOCKER_BUILD_OPT_SECRET := --secret id=extra-root-ca,src=$(EXASTRO_EXTRA_ROOT_CA)
endif


##############################################################################
# Targets

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker build \
		--tag ita-api-server:$(VERSION) \
		--no-cache \
		--build-arg HTTP_PROXY \
		--build-arg http_proxy \
		--build-arg HTTPS_PROXY \
		--build-arg https_proxy \
		--build-arg NO_PROXY \
		--build-arg no_proxy \
		$(DOCKER_BUILD_OPT_SECRET) \
		.


.PHONY: run
run:
	docker run \
		--name ita-api-server \
		--init \
		--detach \
		--publish 8080:80 \
		--mount type=bind,source=$(CURDIR)/exastro,target=/exastro-packages/exastro \
		ita-api-server:$(VERSION)


.PHONY: stop
stop:
	@docker stop ita-api-server


.PHONY: start
start:
	docker start ita-api-server


.PHONY: restart
restart: stop start


.PHONY: rm
rm: stop
	@docker rm ita-api-server
