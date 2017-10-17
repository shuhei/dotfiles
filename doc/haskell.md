# Haskell

## Setup dev tools without stack

`ghc-mod` does not support `cabal` 2. Use `ghc` 8.0 and `cabal` 1.24.

```sh
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.0.2
$ cabal --version
cabal-install version 1.24.0.2
compiled using version 1.24.2.0 of the Cabal library
```

Before installing `ghc-mod`:

```sh
cabal update
cabal install alex
cabal install happy
```

Otherwise `ghc-mod` will fail because its dependency `haskell-src-exts` depends on them. https://github.com/DanielG/ghc-mod/issues/813

Then install nice dev tools:

```sh
cabal install ghc-mod hlint hdevtools hoogle
```
