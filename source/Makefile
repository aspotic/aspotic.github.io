all: install build save deploy

.hugo:
	brew install hugo
	touch .hugo

clean:
	rm -rf docs

install: .hugo

build: clean
	hugo

save: build
	git add ..
	git commit -m 'site update'
	git push

dev: clean
	hugo server -D
