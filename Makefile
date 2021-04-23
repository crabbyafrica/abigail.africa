CLIPBOARD = $(shell pbpaste)
.PHONY: all clean 

# Bootstrap on a clean box: make
all: node_modules public/index.html

node_modules: package.json
	npm install
	touch node_modules

public/index.html: node_modules
	brunch build

server:
	brunch watch --server

# if you just want to remove unnecessary local files: make {clean|nuke}
clean:
	rm -rf public

nuke: clean
	rm -rf node_modules

deploy: 
	brunch build
	vercel

# when ready to push up for production:make production
production:
	brunch build
	vercel --prod

github:
	git add .
	git commit -m "new commit"

# make deploy to check it 
# make production to deploy 
# make nuke 