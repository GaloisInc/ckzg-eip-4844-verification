.PHONY: all
all: bc proofs

.PHONY: bc
bc:
	@make -C bitcode

PROOF_SCRIPTS = permutations

.PHONY: proofs
proofs: bc $(PROOF_SCRIPTS)

WORKING_DIRECTORY = $(shell pwd)

$(PROOF_SCRIPTS):
	@echo "[+] running proofs in for" $@
# We need to tell Cryptol to search in all subdirectories of 'spec'
	CRYPTOLPATH="${WORKING_DIRECTORY}/../spec/" && saw $@.saw
