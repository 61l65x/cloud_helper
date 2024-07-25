COMPOSE_FILE := srcs/docker-compose.yml

all: up

build:
	@echo "Building Docker images..."
	docker-compose -f $(COMPOSE_FILE) build

up:
	@echo "Starting Docker Compose stack..."
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping Docker Compose stack..."
	docker-compose -f $(COMPOSE_FILE) down

restart: down up

status:
	@echo "Docker Compose stack status:"
	docker-compose -f $(COMPOSE_FILE) ps

clean: down
	@echo "Removing Docker volumes..."
	docker-compose -f $(COMPOSE_FILE) down -v

logs:
	@echo "Fetching logs from Docker Compose stack..."
	docker-compose -f $(COMPOSE_FILE) logs -f

.PHONY: all logs clean status restart down up build 
