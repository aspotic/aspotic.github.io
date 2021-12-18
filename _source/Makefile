HUGO ?= docker run --rm -it -v $(PWD):/src --workdir /src -p 1313:1313 klakegg/hugo:latest

all: build save

clean:
	rm -rf docs

build: clean
	$(HUGO)

save:
	git pull	
	git add ..
	git commit -m 'site update'
	git push

dev: clean
	$(HUGO) server -D

serve: clean
	$(HUGO) server

post:
	$(HUGO) new post/$(shell date +'%y_%m_%d_.md')