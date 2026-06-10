#!make
.PHONY: fetch-external-tags

IDENTIFIER = ehf-postaward-g3
TITLE = EHF Post-Award G3
RELEASE = 2022-06-15

RULES_IDENT = no.anskaffelser.ehf.postaward.g3
RULES_FOLDER = src
HAS_GIT_SUBMODULES := $(shell test -d .git -a -f .gitmodules && echo true || echo false)

build: gitsubs

gitsubs:
	@if [ "$(HAS_GIT_SUBMODULES)" = "true" ]; then \
		git submodule sync --recursive; \
		git submodule update --init --recursive; \
	else \
		echo "\033[2;37mSkipping git submodules\033[0m"; \
	fi

include .build/ehf.makefile

# Fetches and extracts remote tags for specific external git repositories
fetch-external-tags:
	@echo "Repository|Tag|Commit Hash|Location | Authored Date"
	@echo "---|---|---|---"
	@# Repository 1: Example pepol-bis-invoice-3
	@git ls-remote --tags --sort='v:refname' https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git | tail -n 5 | awk '{print "OpenPEPPOL/peppol-bis-invoice-3|" $$2 "|" $$1 "|Remote"}' | sed 's|refs/tags/||'
	@# Repository 2: Example peppol-bis-order-3
	@git ls-remote --tags --sort='v:refname' https://github.com/OpenPEPPOL/poacc-upgrade-3.git | tail -n 5 | awk '{print "OpenPEPPOL/poacc-upgrade-3|" $$2 "|" $$1 "|Remote"}' | sed 's|refs/tags/||'
	@# Repository 3: Example peppol-logistics-bis
	@git ls-remote --tags --sort='v:refname' https://github.com/OpenPEPPOL/logistics-bis.git | tail -n 5 | awk '{print "OpenPEPPOL/logistics-bis.git|" $$2 "|" $$1 "|Remote"}' | sed 's|refs/tags/||'



