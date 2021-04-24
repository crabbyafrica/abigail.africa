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

# whenever you have changes to push live, type `git status` to ensure that the files you changed are being seen by git. peace of mind. 
# `git add .` will grab everything in the current folder and anything that's been modified.
# `git commit -m "string"` will commit those files, fuel the rocket, astronauts loading in 
# `git push` actually sends it up to github

# because we connected the project to github, every push will auto-deploy it to my site 
# remember to sandbox in other branches: `git checkout -b branchname` to clone master and give me a sandbox environment 