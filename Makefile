#!make

IDENTIFIER = ehf-postaward-g3
TITLE = EHF Post-Award G3
RELEASE = 2022-06-15

RULES_IDENT = no.anskaffelser.ehf.postaward.g3
RULES_FOLDER = src

include .build/ehf.makefile

gitsubs:
	@git submodule init
	@git submodule update