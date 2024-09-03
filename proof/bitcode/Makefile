all : clean

bc :
	cp ckzg-src-makefile.patch ../../c-kzg-4844/src/makefile.patch
	cd ../../c-kzg-4844/src && git apply makefile.patch && $(MAKE) bc
	cp ../../c-kzg-4844/src/ckzg.bc ckzg.bc

clean :
	rm -f *.bc
