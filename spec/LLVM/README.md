# LLVM Specifications

This folder contains the Cryptol files whose specification of functions more closely matches
the imperative version of the c-kzg codebase that we want to formally verify with the Software
Analysis Workbench (SAW).

We use Cryptol properties to prove that these functions match their corresponding functions
found in the Spec folder.

## Permutations

SAW could not prove the `bit_reversal_permutation` function defined in the `Spec/Permutations.cry`
equivalent to the corresponding c-kzg function ([located here](https://github.com/ethereum/c-kzg-4844/blob/430371ed270e97b5b77babc92c0bafa768f68b32/src/common/utils.c#L103)). So we re-implemented the
function in a more imperative style in `LLVM/Permutations.cry` as `bit_reversal_permutation_fast`,
which SAW can then prove equivalent to the corresponding c-kzg function.

The Cryptol property `bit_reversal_permutations_equiv` facilitates the Cryptol proof that the two
Cryptol specifications, `bit_reversal_permutation` and `bit_reversal_permutation_fast`, are
functionaly equivalent.
