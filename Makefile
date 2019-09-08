all: install build save deploy

install:
	brew install hugo

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

