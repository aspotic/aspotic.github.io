all: install build save deploy

install: .hugo

.hugo:
	brew install hugo
	touch .hugo

build:
	hugo

save:
	git add .
	git commit -m 'site update'
	git push

deploy:
	cd public \
		&& git add . \
		&& git commit -m 'site rebuild' \
		&& git push origin master

