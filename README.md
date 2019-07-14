`dmap`
===

* `dmap` is a universal namespace.
* `dmap` is a utility for evaluating `dpath`s.
* `dpath` is a mini-language for traversing a subset of the Ethereum chain state. It is future-proof and extensible.

This repo contains a reference implementation of `dmap` in JavaScript.

Use Cases
---

`dmap` should be immediately useful for:

* Package distribution (verification)
* GUI distribution (verification)
* Key signing / WoT bootstrapping

Any time you sign an update to a "named something", you could be signing it with a multisig or any other smart contract.


Install
---
```
npm install -g dmap-cmd
```
*(Version 0.0.x has an unstable API. Version 0.1.0 will have a stable `get` and `walk` API for paths containing only `.` runes (separators).)*

Examples
---
```
> dmap .x.
0x180513ff7459ebc79534d3cb8ac26a5a1ac8af0d

> dmap .x.ample.
0xdbb5fbdfdf8f2f87f94f28cbd3cacf3ad28cfda6

> dmap walk .x.ample.
walk .x.ample.
step .x.ample.
step -r 0x20d20820f5d4D310281533CD9154C1bE22D6e195 .x.ample.
  -> 0x180513ff7459ebc79534d3cb8ac26a5a1ac8af0d000000000000000000000000
step -r 0x180513ff7459ebc79534d3cb8ac26a5a1ac8af0d .ample.
  -> 0xdbb5fbdfdf8f2f87f94f28cbd3cacf3ad28cfda6000000000000000000000000
step -r 0xdbb5fbdfdf8f2f87f94f28cbd3cacf3ad28cfda6 .
DONE 0xdbb5fbdfdf8f2f87f94f28cbd3cacf3ad28cfda6
```

Example paths to study
---

Active
```
.             the dmap
.d.           the dmap
.x.           xreg, the worst registry (is DMap, owner is XReg)
.x.ample.     example paths for docs
.x.dmap.      the dmap
```

Future
```
:x:ample:definitly-locked  
:x:ample.possibly-mutable 
.x.ample#ipld
```


Development
---
```
git clone https://github.com/dufolt/dmap
cd dmap
make
```
or
```
git clone keybase://team/dmap/dmap
cd dmap
make
```

* `dmap` command line commands define a query language. `dmap` libraries should implement `dmap("walk .x.ample.path").` first and `.walk(path)` helper methods second.

Agenda
---

* `dmap type-info` by path, by address
* `.` rune
* `:` rune
* source bootstrap (git hash on chain, `dmap update` verifies it before linking)
* `^` rune


