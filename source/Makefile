all: install build save deploy

clean:
	rm -rf docs

install: .hugo

.hugo:
	brew install hugo
	touch .hugo

build: clean
	hugo

save: build
	git add ..
	git commit -m 'site update'
	git push

dev: clean
	hugo server -D