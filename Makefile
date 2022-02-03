
.PHONY : all
all : js/story.js

js/story.js: js/story_template.js js/story.json
	cat js/story_template.js > js/story.js
	cat js/story.json >> js/story.js

js/story.json: story.ink tools/inklecate
	tools/inklecate -j -o js/story.json story.ink

tools/inklecate: tools/inklecate_linux.zip
	cd tools && unzip inklecate_linux.zip
	
tools/inklecate_linux.zip:
	wget -o tools/inklecate_linux.zip https://github.com/inkle/ink/releases/download/v1.0.0/inklecate_linux.zip	