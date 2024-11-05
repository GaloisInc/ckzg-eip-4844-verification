# Cryptol Test Vectors

## Generation of Test Vectors
Test cases can be done using `:dumptests` REPL command in Cryptol.

This directory contains directories which have single test case for the named function. Example below is how the first test case for `evaluate_polynomial_in_evaluation_form` was generated.

From the `spec` directory run the following:

``` bash
% cryptol Spec/Polynomials.cry
┏━╸┏━┓╻ ╻┏━┓╺┳╸┏━┓╻
┃  ┣┳┛┗┳┛┣━┛ ┃ ┃ ┃┃
┗━╸╹┗╸ ╹ ╹   ╹ ┗━┛┗━╸
version 3.2.0 (1bcb75c)
https://cryptol.net  :? for help

Loading module Cryptol
Loading module Common::Utils
Loading module Spec::BlsEC
Loading module Spec::BlsSerde
Loading module Spec::BlsHelpers
Loading module Spec::Permutations
Loading module Spec::Polynomials
Spec::Polynomials> :set tests=1
Spec::Polynomials> :dumptests result1.txt evaluate_polynomial_in_evaluation_form
```

## Linking to Python Spec
A patch that adds hard coded test vectors to `consensus-specs` has been created and stored in `add-tests-to-consensus-specs.patch`.

In order to run these open a copy of `consensus-specs`.

Ensure that you have done the necessary commands to enable running their python tests:

```bash
% make install_test
% make pyspec
% . venv/bin/activate
```

Then apply the patch:
```bash
% git am < add-tests-to-consensus-specs.patch
```

After patch has been applied you should be able to run the tests added an example for `evaluate_polynomial_in_evaluation_form` is given below:
```bash
% cd tests/core/pyspec
% python -m pytest -k evaluate_polynomial_in_evaluation_form --fork deneb eth2spec
```

To revert the patch afterwards:
```bash
% git reset --hard origin/dev
```
