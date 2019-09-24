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

# MAIN COMMANDS
start:
	make docker-up
stop:
	make docker-down
restart:
	make stop && \
	make start
build:
	make docker-build-no-cached
reload:
	make build && \
	make restart
status:
	make docker-ps
logs:
	make docker-logs