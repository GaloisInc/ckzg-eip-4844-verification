.PHONY: all
all: bc proofs

.PHONY: bc
bc:
	@make -C bitcode

PROOF_SCRIPTS = permutations

.PHONY: proofs
proofs: bc $(PROOF_SCRIPTS)

$(PROOF_SCRIPTS):
	@echo "[+] running proofs in for" $@
	saw $@.saw
