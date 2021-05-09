all: install build save

.hugo:
	brew install hugo
	touch .hugo

clean:
	rm -rf docs

install: .hugo

build: clean
	hugo

save: build
	git pull	
	git add ..
	git commit -m 'site update'
	git push

dev: clean
	hugo server -D

serve: clean
	hugo server

update:
	brew upgrade hugo