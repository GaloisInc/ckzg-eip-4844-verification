# BlsEC Specifications

The Cryptol modules in this subfolder implement the underlying BLS Elliptic Curver operations for the
curves and fields, including the pairing algorithm.

Our implementations are derived from the [py-ecc](https://github.com/ethereum/py_ecc) library and are intended to be easily visually verified against that codebase. Our module structure does not always match that of py-ecc, thus
we have source code documentation references from all of our functions, types, and constants that
point to their matching source in py-ecc (and sometimes the Deneb Python Specification).

## Module Details

The FQP module (polynomial extension fields with the prime Q) is used for both FQ2 and FQ12.
Likewise, the GP module (group curver operations for the polynomial extension fields) is used
for both G2 and G12.

The Poly module containst the extended euclidean algorithm for polynomials to performer modular
inverse in FQ2 and FQ12.
