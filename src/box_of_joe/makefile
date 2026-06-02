.PHONY: default
default: build

.PHONY: build
build:
	docker build -t box_of_joe .

.PHONY: run
run:
	docker run --name box \
		--net=host \
		-it \
		box_of_joe

.PHONY: stop
stop:
	docker stop box
	docker rm box

.PHONY: attach
attach:
	docker exec -it box bash

