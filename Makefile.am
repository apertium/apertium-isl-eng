LANG1=isl
LANG2=eng
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

##
##	BUILD TARGETS
##

TARGETS_COMMON =  \
     $(PREFIX1).automorf.bin $(PREFIX1).autobil.bin $(PREFIX1).autogen.bin \
     $(PREFIX1).autopgen.bin $(PREFIX1).t0x.bin $(PREFIX1).t1x.bin  $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin $(PREFIX1).t4x.bin \
     $(PREFIX1).lex.bin $(PREFIX1).rlx.bin

##
## 	DICTIONARIES (ANALYSER / BILINGUAL / GENERATOR / POSTGEN)
##

# Use this goal for creating .deps, otherwise make -j2 will give problems:
@ap_include@

$(PREFIX2).autogen.bin: $(AP_SRC1)/$(LANG1).autogen.bin
	cp $< $@

$(PREFIX1).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1).autobil.bin
	lt-trim $^ $@

#$(PREFIX1).automorf.bin: $(BASENAME).$(LANG1).dix
#	apertium-validate-dictionary $(BASENAME).$(LANG1).dix
#	lt-comp lr $(BASENAME).$(LANG1).dix $@

.deps/$(BASENAME).$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix lexchoicebil.xsl .deps/.d
	xsltproc lexchoicebil.xsl $(BASENAME).$(PREFIX1).dix > $@

$(PREFIX1).autobil.bin: .deps/$(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary .deps/$(BASENAME).$(PREFIX1).dix
	lt-comp lr .deps/$(BASENAME).$(PREFIX1).dix $@

$(PREFIX1).autogen.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).$(LANG2).dix
	lt-comp rl $(BASENAME).$(LANG2).dix $@

$(PREFIX1).autopgen.bin: $(BASENAME).post-$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).post-$(LANG2).dix
	lt-comp lr $(BASENAME).post-$(LANG2).dix $@

##
##	PRE-TAGGING
##

$(PREFIX1).rlx.bin: $(BASENAME).$(PREFIX1).rlx
	cg-comp $(BASENAME).$(PREFIX1).rlx $@

##
##	LEXICAL SELECTION
##

$(PREFIX1).lex.bin: $(BASENAME).$(PREFIX1).lex
	cg-comp $(BASENAME).$(PREFIX1).lex $@

##
##	TRANSFER RULES
##

$(PREFIX1).t0x.bin: $(BASENAME).$(PREFIX1).t0x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t0x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t0x $@

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX1).t4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t4x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t4x $@

##
##	FILES WHICH AREN'T BUILD BUT ARE DISTRIBUTED
##

EXTRA_DIST=$(BASENAME).$(LANG1).dix $(BASENAME).$(PREFIX1).dix \
	   $(BASENAME).$(LANG2).dix \
           $(BASENAME).post-$(LANG2).dix \
           $(BASENAME).$(PREFIX1).t0x \
	   $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x \
	   $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX1).t4x \
	   $(BASENAME).$(PREFIX1).rlx $(BASENAME).$(PREFIX1).lex \
	   $(BASENAME).$(LANG1).tsx \
	   lexchoicebil.xsl \
	   ACKNOWLEDGEMENTS \
	   modes.xml

#           $(LANG1)-tagger-data/README $(LANG2)-tagger-data/README

apertium_isl_engdir=$(prefix)/share/apertium/apertium-$(PREFIX1)/

apertium_isl_eng_DATA=$(TARGETS_COMMON) \
	$(BASENAME).$(PREFIX1).t0x \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX1).t4x \
	$(PREFIX1).prob

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

install-data-local: install-modes

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

test: all
	apertium-regtest test
