dev: 
	docker-compose up --build -d --remove-orphans

clean:
	docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc) --force
	docker image prune --filter="dangling=true" --force
