bundle-install:
	docker-compose run --rm backend bundle install --without production

bundle-update:
	docker compose run --rm backend bundle update

db-migrate:
	docker compose run --rm backend bundle exec rails db:migrate RAILS_ENV=development

precompile:
	docker compose run --rm backend bundle exec rails assets:precompile RAILS_ENV=development

test:
	docker compose run --rm backend bundle exec rspec

build:
	docker compose build

build-nc:
	docker compose build --no-cache

down:
	docker compose down

up:
	docker compose up -d

stop:
	docker compose stop

exec-backend:
	docker compose exec backend bash

exec-db:
	docker compose exec db bash

run-backend:
	docker compose run --rm backend bash

run-db:
	docker compose run --rm db bash

lint:
	docker compose run --rm backend bundle exec rubocop -A