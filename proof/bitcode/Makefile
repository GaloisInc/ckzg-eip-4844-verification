.PHONY: all
all: clean bc

.PHONY: bc
bc:
	@if test -f ../../c-kzg-4844/src/makefile.patch; then\
		echo "[+] patch file already applied"; \
	else \
		echo "[+] applying patch file" && \
		cp ckzg-src-makefile.patch ../../c-kzg-4844/src/makefile.patch && \
		cd ../../c-kzg-4844/src && git apply makefile.patch; \
	fi
	cd ../../c-kzg-4844/src && $(MAKE) bc
	cp ../../c-kzg-4844/src/ckzg.bc ckzg.bc

.PHONY: clean
clean:
	rm -f *.bc
