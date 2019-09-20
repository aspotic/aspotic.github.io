all: install build save deploy

install: .hugo

.hugo:
	brew install hugo
	touch .hugo

build:
	rm -rf docs
	hugo

save:
	git add .
	git commit -m 'site update'
	git push

dev:
	hugo server -D