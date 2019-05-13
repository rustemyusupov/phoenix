dir=${CURDIR}
project=-p phoenix

build:
	@docker-compose ${project} build --no-cache

start:
	@docker-compose ${project} up -d

stop:
	@docker-compose ${project} down

restart: stop start

ssh:
	@docker-compose ${project} exec phoenix sh

exec:
	@docker-compose exec phoenix $$cmd

reset:
	@make exec cmd="mix ecto.reset"

migrate:
	@make exec cmd="mix ecto.migrate"

logs:
	@docker-compose ${project} logs --tail=20 -f phoenix

test:
	@make exec cmd="mix test --cover"