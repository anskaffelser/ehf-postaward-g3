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
		git submodule update --init --remote --recursive; \
	else \
		echo "\033[2;37mSkipping git submodules\033[0m"; \
	fi

include .build/ehf.makefile

# Fetches and extracts remote tags for specific external git repositories
fetch-external-tags:
	@echo "Repository|Tag|Commit Hash|Location|Authored Date";
	@echo "---|---|---|---|---";
	@for repo in OpenPEPPOL/peppol-bis-invoice-3 OpenPEPPOL/poacc-upgrade-3 OpenPEPPOL/logistics-bis; do tmp="$(mktemp -d)"; git -C "$tmp" init -q; git -C "$tmp" remote add origin "https://github.com/$repo.git"; git -C "$tmp" fetch -q --tags origin; git -C "$tmp" for-each-ref --sort=-creatordate --format="$repo|%(refname:short)|%(objectname)|Remote|%(creatordate:short)" refs/tags | head -n 5; rm -rf "$tmp"; done | column -t -s '|'