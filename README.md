# Accelerate BLAS Test Project

This repository is a minimal buildable example of a project using
[Accelerate][accelerate] and [Accelerate-BLAS][accelerate-blas].

Note the cabal.project file containing the constraints

    constraints: blas-hs +cblas +openblas

which tells the Haskell `blas-hs` library (used for the `Native` backend's BLAS
implementation) how to link to the system's C BLAS library.
For details on these flags, see the [blas-hs README][blas-hs-docs]

[accelerate]: https://hackage.haskell.org/package/accelerate
[accelerate-blas]: https://hackage.haskell.org/package/accelerate-blas
[blas-hs-docs]: https://github.com/Rufflewind/blas-hs#linking-to-blas

# Build and Run

With system dependencies installed, you should be able to run simply with

    cabal build
    cabal run

On Arch Linux, I have tested with the following system dependencies:

- openblas 0.3.12-1
- cblas 3.9.0-3
- cuda 10.2.89-5

I haven't yet tested on other platforms. Please open an issue if you have
problems.

# Issues

While this project builds, I still get the below linker errors when running
`cabal repl`:

    undefined symbol: _ZSt7nothrow
