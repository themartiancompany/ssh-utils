#
# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/ssh-utils
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard ssh-utils/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 ssh-utils/mksshconfig "$(BIN_DIR)/mksshconfig"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
