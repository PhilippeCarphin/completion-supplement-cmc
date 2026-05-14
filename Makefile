modulefile=share/modulefiles/completion-supplement-cmc
PREFIX ?= localinstall

all: module

install:module
	install -D share/bash-completion/completions/_glcurl $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_glcurl
	install -D share/bash-completion/completions/_voir $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_voir
	install -D share/bash-completion/completions/_ord_soumet $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_ord_soumet
	install -D share/bash-completion/completions/_hcron $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_hcron
	install -D share/bash-completion/completions/_clone_suite $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_clone_suite
	install -D share/modulefiles/completion-supplement-cmc $(DESTDIR)$(PREFIX)/share/modulefiles/completion-supplement-cmc

module:$(modulefile)
$(modulefile):modulefile.in
	sed 's|@PREFIX@|$(realpath $(PREFIX))|g' $^ >$@

install-dev:module
	mkdir -p $(DESTDIR)$(PREFIX)/share/bash-completion/completions
	ln -snf  $(PWD)/share/bash-completion/completions/_glcurl $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_glcurl
	ln -snf  $(PWD)/share/bash-completion/completions/_voir $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_voir
	ln -snf  $(PWD)/share/bash-completion/completions/_ord_soumet $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_ord_soumet
	ln -snf  $(PWD)/share/bash-completion/completions/_hcron $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_hcron
	ln -snf  $(PWD)/share/bash-completion/completions/_clone_suite $(DESTDIR)$(PREFIX)/share/bash-completion/completions/_clone_suite
	ln -snf  $(PWD)/share/modulefiles/completion-supplement-cmc $(DESTDIR)$(PREFIX)/share/modulefiles/completion-supplement-cmc

clean:
	rm -f share/modulefiles/*
