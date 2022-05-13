.PHONY: all help g cpy update

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
CYAN   := $(shell tput -Txterm setaf 6)
RESET  := $(shell tput -Txterm sgr0  )

COMMIT ?= update dotfiles

all: help ## all

update: cpy g ## Copy and Push

## Subcommands:
g: ## Commit and push. Use COMMIT="commit" to specify
	@echo ===================PUSH==========================
	git add --all
	git commit -m "$(COMMIT)"
	git push origin main

cpy: ## Copy dotfiles
	@echo ==================COPY DOTFILES==================
	cp ../.bashrc ./
	cp ../.zshrc ./	
	cp ../.gitconfig ./
	cp ../.tmux.conf ./
	rsync -av --progress ../.config .config --exclude coc-go-data --exclude node_modules
		
## Help:
help: ## Show this help.
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a-zA-Z_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-20s${GREEN}%s${RESET}\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)
