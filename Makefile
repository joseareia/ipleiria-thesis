# Author: José Areia (jose.apareia@gmail.com)
# Creation Date: 2024/11/07
# Version: 2.0.0
# Original Reference: Stéphane Caron - Makefiles for LaTeX
# Reference Link: https://scaron.info/blog/makefiles-for-latex.html
# Dependencies: ["rubber", "latexmk", "inotify-tools"]

PAPER=IPLeiriaMain.tex
SHELL=/bin/bash
TOOL=latexmk

all:
	@echo "Building $(PAPER) with $(TOOL)..."
ifeq ($(TOOL),rubber)
	@rubber --pdf --module xelatex --shell-escape $(PAPER)
else ifeq ($(TOOL),latexmk)
	@latexmk -pdf -xelatex -shell-escape $(PAPER)
else
	@echo "Error: Unsupported tool '$(TOOL)'. Use 'rubber' or 'latexmk'."
	@exit 1
endif
	@echo "Build complete."

clean:
	@echo "Cleaning up..."
ifeq ($(TOOL),rubber)
	@rubber --clean $(PAPER)
else ifeq ($(TOOL),latexmk)
	@latexmk -C
endif
	@for ext in acn acr alg fls xdv fdb_latexmk toc; do \
		if compgen -G "*.$$ext" > /dev/null; then \
			rm -f *.$$ext; \
		fi; \
	done
	@echo "Clean complete."

watch:
ifeq ($(SHELL),/bin/zsh)
	@echo "Watching $(PAPER) for changes (zsh)..."
	@while true; do inotifywait -e close_write $(PAPER); sleep 0.01; make all; done
else
	@echo "Watching $(PAPER) for changes (bash)..."
	@while true; do inotifywait -e close_write $(PAPER); sleep 0.01; make all; done
endif