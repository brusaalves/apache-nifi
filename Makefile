# DEFAULT CONFIG
BASE_DIR=$(shell pwd)

# IMPORT VARIABLES
include env/.env

# RUN MAVEN
run-mvn:
	make run-docker command="run --rm maven mvn $(command)"

# MAVEN
mvn-clean:
	make run-mvn command="clean"
mvn-install:
	make run-mvn command="install"
mvn-clean-install:
	make run-mvn command="clean install"
mvn-dependency-resolve:
	make run-mvn command="dependency:resolve"
mvn-package:
	make run-mvn command="package"

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

# START AND STOP APPLICATION
start:
	make docker-up
stop:
	make docker-down
status:
	make docker-ps

# APACHE NIFI PACKAGES
# link-nars:
# 	ln -s $(ls $(nars_locations) -d -1 "$PWD/"**/* | grep "\.nar") ./app/src/package/custom
# unlink-nars:
# 	rm $(find ./app/src/package/custom -type l)
