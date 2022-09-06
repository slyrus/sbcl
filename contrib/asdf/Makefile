DEST=$(SBCL_TOP)/obj/sbcl-home/contrib/
ASDF_FASL=$(DEST)/asdf.fasl
FASL=$(ASDF_FASL)
FROB_READTABLE='(setf (sb-ext:readtable-base-char-preference *readtable*) :both)'

fasl:: $(ASDF_FASL)
$(ASDF_FASL):: asdf.lisp ../../output/sbcl.core
	if [ -d asdf-upstream ] ; then rm -rf asdf-upstream ; fi
	mkdir -p $(DEST)
	$(SBCL) --eval $(FROB_READTABLE) --eval '(compile-file #p"SYS:CONTRIB;ASDF;ASDF.LISP" :print nil :output-file (merge-pathnames (parse-native-namestring "$@")))' </dev/null

install::
	cp $(FASL) "$(BUILD_ROOT)$(INSTALL_DIR)"

build:: $(FASL)
	true
test:: $(FASL)
	true

UPSTREAM=../../obj/asdf-upstream
up::
	sh pull-asdf.sh
