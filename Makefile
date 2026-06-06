completions=$(wildcard share/bash-completion/completions/_*)
modulefile=share/modulefiles/completion-supplement-cmc
PREFIX ?= $(HOME)/.local

all: module

install:module
	for comp in $(completions) ; do install -vD -m 644 $${comp} $(DESTDIR)$(PREFIX)/$${comp} ; done
	install -D -m 644 $(modulefile) $(DESTDIR)$(PREFIX)/share/modulefiles/completion-supplement-cmc

.PHONY: $(modulefile)
module:$(modulefile)
$(modulefile):modulefile.in
	sed 's|@PREFIX@|$(realpath $(PREFIX))|g' $< >$@
	sed -i 's|@COMPLETIONS@|$(shell echo "$(completions)" | sed 's+[^ ]*/_\([^ ]*\)\( \|$$\)+puts stderr \"- \1\" ; +g')|g' $@

install-dev:module
	mkdir -p $(DESTDIR)$(PREFIX)/share/bash-completion/completions $(DESTDIR)$(PREFIX)/share/modulefiles
	for comp in $(completions) ; do ln -snfv $(PWD)/$${comp} $(DESTDIR)$(PREFIX)/$${comp} ; done
	ln -snf  $(PWD)/$(modulefile) $(DESTDIR)$(PREFIX)/share/modulefiles/completion-supplement-cmc

link-dot-local:
	PREFIX=$(HOME)/.local $(MAKE) install-dev

clean:
	rm -f share/modulefiles/*
