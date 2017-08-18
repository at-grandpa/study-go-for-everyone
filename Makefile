DOCKER_COMPOSE := docker-compose -f ./docker-compose.yml
DOCKER_EXEC := docker exec -it
CONTAINER_NAME := study-go-for-everyone

ps:
	$(DOCKER_COMPOSE) ps

setup: build up

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

clean: stop rm

stop:
	$(DOCKER_COMPOSE) stop

rm:
	$(DOCKER_COMPOSE) rm -f

attach:
	$(DOCKER_EXEC) $(CONTAINER_NAME) /bin/bash

go/%:
	$(DOCKER_EXEC) $(CONTAINER_NAME) /bin/bash -c "go $* $(SRC)"

initialize:
	$(DOCKER_EXEC) $(CONTAINER_NAME) make -f ./bin/initialize.mk initialize