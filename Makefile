IMAGE_NAME = trustify
COMPOSE_FILE_1 = docker-compose.yml

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test1
test1: build
	docker compose -f $(COMPOSE_FILE_1) up -d --build

.PHONY: down-test1
down-test1:
	docker compose -f $(COMPOSE_FILE_1) down

.PHONY: clean
clean: down-test1 
	docker image rm $(IMAGE_NAME) || true
	docker volume prune -f
	docker network prune -f
	docker container prune -f

.PHONY: test
test: test1