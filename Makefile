task = compass
up:
	docker-compose up -d

down:
	docker-compose down

in:
	docker-compose exec ${task}-env bash

build:
	docker build -t qiangzibro/${task}:latest . --network host \
			--build-arg http_proxy=${http_proxy}\
			--build-arg https_proxy=${https_proxy}

build_without_proxy:
	docker build -t qiangzibro/${task}:latest .
