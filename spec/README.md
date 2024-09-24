# Cryptol specification

The code inside this directory contains the Cryptol specification necessary for creating the Software Analysis Workbench (SAW) proofs.

The subdirectory `Spec` contains all Cryptol modules that match the [Deneb Python specification](https://github.com/ethereum/consensus-specs/blob/dev/specs/deneb/polynomial-commitments.md).

The subdirectory `LLVM` contains all Cryptol modules that more closely match the [c-kzg library](https://github.com/ethereum/c-kzg-4844/tree/main). These modules are required by the SAW proofs, and will be also proven equivalent to their Cryptol counterparts found in `Spec`.

The subdirectory `Common` contains Cryptol modules that contain utility functions that not part of either specification, but helpful for decomposition and abstraction of the Cryptol codebase.

## Minimum Required Version

The minimum required version of Cryptol is [3.2](https://github.com/GaloisInc/cryptol/releases/tag/3.2.0), in order to support top-level module docstrings.
