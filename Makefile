topsrc = ./
prefix = /usr/local
datarootdir = ${prefix}/share

MAKE = make
GRETLCLI = ${prefix}/bin/gretlcli

PKG = BACE
PKGSRC = $(topsrc)

vpath %.inp $(PKGSRC)
vpath %.spec $(PKGSRC)

all: $(PKG).gfn pdfdoc $(PKG).zip

$(PKG).gfn: 
	$(GRETLCLI) -t pkg.inp

$(PKG).zip: $(PKG).gfn pdfdoc
	echo makepkg $(PKG).zip | $(GRETLCLI) -t -

.PHONY : pdfdoc clean distclean

pdfdoc:
	@$(MAKE) -C doc

clean: 
	@rm -f $(PKG).gfn $(PKG).xml $(PKG).zip

distclean: 
	@rm -f $(PKG).gfn $(PKG).xml $(PKG).zip
	@rm -f *.pdf test.out
	@$(MAKE) -C doc clean

