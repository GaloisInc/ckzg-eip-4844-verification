# The Cryptol Spec

This folder contains the executable Cryptol specification that implements the [Deneb Python specification](https://github.com/ethereum/consensus-specs/blob/dev/specs/deneb/polynomial-commitments.md) for using the KZG commitment scheme in ZK proofs with the BLS12-381 curve.
This folder also contains an executable specification for all of the BLS12-381 elliptic curve
operations needed. These modules are found in `BlsEC`.

## Specification Mapping

The table below indicates the Cryptol module where the corresponding Deneb function is implemented.

| Deneb Function     | Cryptol Module      |
|--------------------|---------------------|
| is_power_of_two    | Spec::Permutations  |
| reverse_bits       | Spec::Permutations  |
| bit_reversal_permutation | Spec::Permutations |
| multi_exp          | Spec::BlsHelpers    |
| bytes_to_bls_field | Spec::BlsHelpers    |
| bls_field_to_bytes | Spec::BlsHelpers    |
| validate_kzg_g1    | Spec::BlsHelpers    |
| bytes_to_kzg_commitment | Spec::BlsHelpers |
| bytes_to_kzg_proof | Spec::BlsHelpers    |
| compute_challenge  | Not yet implemented |
| g1_lincomb         | Spec::BlsHelpers    |
| compute_powers     | Spec::BlsHelpers    |
| compute_roots_of_unity | Spec::BlsHelpers |
| blob_to_polynomial | Spec::Polynomials   |
| evaluate_polynomial_in_evaluation_form   | Spec::Polynomials |
| blob_to_kzg_commitment | Spec::KZG       |
| verify_kzg_proof       | Spec::KZG       |
| verify_kzg_proof_impl  | Spec::KZG       |
| verify_kzg_proof_batch | Not yet implemented |
| compute_kzg_proof      | Spec::KZG       |
| compute_kzg_proof_impl | Spec::KZG       |
| compute_quotient_eval_within_domain | Spec::KZG |
| compute_blob_kzg_proof | Not yet implemented |
| verify_blob_kzg_proof  | Not yet implemented |
| verify_blob_kzg_proof_batch |Not yet implemented |

## Tests

Use `find` to list available tests:

```bash
$ find Spec/Test -name 'TV*.cry'
Spec/Test/KZG/ComputeQuotient/TV1.cry
Spec/Test/KZG/ComputeProof/TV1.cry
Spec/Test/KZG/VerifyProof/TV1.cry
Spec/Test/Polynomials/TV1.cry
```

For example, to run a specific test file:

```bash
cryptol --command=":check-docstrings" Spec/Test/KZG/VerifyProof/TV1.cry
```

To run all tests, run the following:

```bash
for test in $(find Spec/Test -name 'TV*.cry'); do
    cryptol --command=":check-docstrings" $test
done
```
