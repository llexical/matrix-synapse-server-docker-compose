export PROJECT_NAME := $(notdir $(CURDIR))

.PHONY: dev-run
dev-run: ## Run a local instance of listings
	docker-compose up

.PHONY: dev-stop ## Shutdown the running container and remove any intermediate images. Usfull for when you think the container is stopped but docker doesn’t
dev-stop:
	docker-compose down

.PHONY: dev-clean
dev-clean: ## Remove all the docker containers for this project
	docker-compose down --rmi local --volumes

.PHONY: help
help: ## This message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help