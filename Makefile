
.PHONY : all
all : js/story.js

MAIN_STORY_FILE = main.ink
STORY_FILES = $(MAIN_STORY_FILE) common_functions.ink main_menu.ink game_loop.ink prolog.ink print_functions.ink inventory.ink market.ink
MAIN_STORY_FILEPATH = $(addprefix story/,$(MAIN_STORY_FILE))
STORY_FILEPATHS = $(addprefix story/,$(STORY_FILES))


js/story.js: js/story_template.js js/story.json
	cat js/story_template.js > js/story.js
	cat js/story.json >> js/story.js

js/story.json: tools/inklecate $(STORY_FILEPATHS)
	tools/inklecate -j -o js/story_with_bom.json $(MAIN_STORY_FILEPATH)
	iconv -f utf-8 -t utf-16le js/story_with_bom.json | iconv -f utf-16 -t utf-8 > js/story.json

tools/inklecate: tools/inklecate_linux.zip
	cd tools && unzip inklecate_linux.zip && touch inklecate
	
tools/inklecate_linux.zip:
	wget -O tools/inklecate_linux.zip https://github.com/inkle/ink/releases/download/v1.0.0/inklecate_linux.zip	

tools/Ink.tmLanguage:
	wget -O tools/Ink.tmLanguage https://github.com/inkle/ink-tmlanguage/releases/download/0.2.3/Ink.tmLanguage
	# to use in Sublime:
	# open file "tools/Ink.tmLanguage"
	# Select from Menu: "Tools/Developer/New Syntax from Ink.tmLanguage..."
	# Sublime will generate and open new file "Ink.sublime-syntax"
	# Save file in default folder (e.g. "%AppData%\Sublime Text 3\Packages\User\")
	# Open file "story.ink"
	# Open Command palette Ctrl+Shift+P and search for "set syntax ink", confirm with enter.
	# 
