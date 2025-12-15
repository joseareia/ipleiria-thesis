# Author: José Areia (jose.apareia@gmail.com)
# Version: 2.1.0 - 2025-12-15
# Original Reference: Stéphane Caron - Makefiles for LaTeX
# Reference Link: https://scaron.info/blog/makefiles-for-latex.html
# Dependencies: ["rubber", "latexmk", "inotify-tools"]

DOCUMENT=IPLeiriaMain.tex
SHELL=/bin/bash
TOOL=latexmk

all:
	@$(MAKE) check-minted
	@$(MAKE) build

check-minted:
	@echo "Checking minted version..."
	@MINTED_VERSION=$$(sed -n 's/.* v\([0-9.]*\) .*/\1/p' $$(kpsewhich minted.sty) | head -n 1); \
	if [ -z "$$MINTED_VERSION" ]; then \
		echo "Error: Could not determine minted version."; \
		exit 1; \
	fi; \
	echo "Detected minted version: $$MINTED_VERSION"; \
	MAJOR_VERSION=$$(echo $$MINTED_VERSION | cut -d. -f1); \
	if [ "$$MAJOR_VERSION" -lt 3 ]; then \
		echo "Version < 3.0.0, modifying IPLeiriaThesis.cls..."; \
		sed -i.bak 's/\\RequirePackage\[newfloat\]{minted}/\\RequirePackage[newfloat,outputdir=.aux]{minted}/' IPLeiriaThesis.cls; \
		echo "Modification complete. Backup saved as IPLeiriaThesis.cls.bak"; \
	else \
		echo "Version >= 3.0.0, no modification required."; \
	fi

build:
	@echo "Building $(DOCUMENT) with $(TOOL)..."
ifeq ($(TOOL),rubber)
	@rubber --pdf --module xelatex --shell-escape $(DOCUMENT)
else ifeq ($(TOOL),latexmk)
	@latexmk -pdf -xelatex -shell-escape $(DOCUMENT)
else
	@echo "Error: Unsupported tool '$(TOOL)'. Use 'rubber' or 'latexmk'."
	@exit 1
endif
	@echo "Build complete."

clean:
	@echo "Cleaning up..."
ifeq ($(TOOL),rubber)
	@rubber --clean $(DOCUMENT)
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
	@echo "Watching $(DOCUMENT) for changes (zsh)..."
	@while true; do inotifywait -e close_write $(DOCUMENT); sleep 0.01; make all; done
else
	@echo "Watching $(DOCUMENT) for changes (bash)..."
	@while true; do inotifywait -e close_write $(DOCUMENT); sleep 0.01; make all; done
endif