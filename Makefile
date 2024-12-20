# Co-Author: José Areia (jose.apareia@gmail.com)
# Date: 2024-11-07
# Version: 1.0.0
# Original Reference: Stéphane Caron - Makefiles for LaTeX
# Reference Link: https://scaron.info/blog/makefiles-for-latex.html
# Dependencies: ["rubber", "inotify-tools"]

PAPER=IPLeiriaMain.tex
SHELL=/bin/bash

all:
	@echo "Building $(PAPER)..."
	rubber --pdf --module xelatex --shell-escape $(PAPER)
	@echo "Build complete."

clean:
	@echo "Cleaning up..."
	rubber --clean $(PAPER)
	rm *.acn *.acr *.alg *.fls *.xdv *.fdb_latexmk *.toc
	@echo "Clean complete."

watch:
	ifeq ($(SHELL),/bin/zsh)
		@echo "Watching $(PAPER) for changes (zsh)..."
		@while true; do inotifywait -e close_write $(PAPER); sleep 0.01; make all; done
	else
		@echo "Watching $(PAPER) for changes (bash)..."
		@while true; do inotifywait -e close_write $(PAPER); sleep 0.01; make all; done
	endif