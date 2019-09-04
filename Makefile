# DEFAULT CONFIG
BASE_DIR=$(shell pwd)

# IMPORT VARIABLES
include env/.env

# RUN DOCKER
run-docker:
	cd env && docker-compose $(command)

# DOCKER
docker-up:
	make run-docker command="up -d"
docker-down:
	make run-docker command="down"
docker-logs:
	make run-docker command="logs -f"
docker-ps:
	make run-docker command="ps"
docker-build:
	make run-docker command="build"
docker-build-no-cached:
	make run-docker command="build --no-cache"

# START AND STOP APPLICATION
start:
	make docker-build && \
	make docker-up
stop:
	make docker-down
logs:
	make docker-logs
status:
	make docker-ps

# APACHE NIFI PACKAGES
# link-nars:
# 	ln -s $(ls $(nars_locations) -d -1 "$PWD/"**/* | grep "\.nar") ./app/src/package/custom
# unlink-nars:
# 	rm $(find ./app/src/package/custom -type l)
