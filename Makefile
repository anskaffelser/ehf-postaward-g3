#!make

IDENTIFIER = ehf-postaward-g3
TITLE = EHF Post-Award G3
RELEASE = 2022-06-15

RULES_IDENT = no.anskaffelser.ehf.postaward.g3
RULES_FOLDER = src
HAS_GIT_SUBMODULES := $(shell test -d .git -a -f .gitmodules && echo true || echo false)

include .build/ehf.makefile

build: gitsubs

gitsubs:
	@if [ "$(HAS_GIT_SUBMODULES)" = "true" ]; then \
		git submodule sync --recursive; \
		git submodule update --init --recursive; \
	else \
		echo "\033[2;37mSkipping git submodules\033[0m"; \
	fi