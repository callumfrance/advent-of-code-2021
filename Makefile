docker-build:
	docker build -t advent_smalltalk_2021 .

docker-run:
	docker run -it advent_smalltalk_2021

dockerize:
	make docker-build && make docker-run