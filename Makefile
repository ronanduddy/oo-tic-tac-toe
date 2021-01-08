.PHONY: run test guard shell build

APP=oo-tic-tac-toe
RUN=@docker-compose run --rm ${APP}

run: build
	 ${RUN} ruby tic_tac_toe/game_runner.rb

test: build
	${RUN} bundle exec rspec

guard: build
	${RUN} bundle exec guard

shell: build
	${RUN} sh

build:
	@docker-compose build ${APP}
