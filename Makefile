# docker container/image
build:
	docker compose build

build-nc:
	docker compose build --no-cache

up:
	docker compose up -d

stop:
	docker compose stop

down:
	docker compose down

# Backend
exec-be:
	docker compose exec backend bash

run-be:
	docker compose run --rm backend bash

bundle-install:
	docker compose run --rm backend bundle install --without production

bundle-update:
	docker compose run --rm backend bundle update

db-migrate:
	docker compose run --rm backend bundle exec rails db:migrate RAILS_ENV=development

precompile:
	docker compose run --rm backend bundle exec rails assets:precompile RAILS_ENV=development

test:
	docker compose run --rm backend bundle exec rspec

lint:
	docker compose run --rm backend bundle exec rubocop -a

bp: test lint

# about frontend
exec-fe:
	docker compose exec frontend sh

# about db
run-db:
	docker compose run --rm db bash

exec-db:
	docker compose exec db bash
