# cashu-nuts-book

The [Cashu Notation, Usage, and Terminology (NUTs)](https://github.com/cashubtc/nuts), compiled into a readable book.

NUTs are the community's specs for Chaumian ecash on Bitcoin. Upstream they live as numbered markdown files. This project leaves that text alone, groups related NUTs into chapters, and builds an ebook from the result.

The book is compiled by Adam Shannon. The NUTs are written by their original authors.

## Get the book

- [ePUB](https://github.com/adamdecaf/cashu-nuts-book/raw/master/cashu-book.epub)
- [PDF](https://github.com/adamdecaf/cashu-nuts-book/raw/master/cashu-book.pdf)

## What's inside

Chapters, not NUT numbers:

1. Core protocol — cryptography, mint keys, keysets, mint info (mandatory)
2. Minting, melting, and swapping — the three verbs, plus fees and batching
3. Proofs, restore, and wallet state — state checks, DLEQ, deterministic secrets
4. Spending conditions — P2PK, HTLCs, pay-to-blinded-key
5. Lightning and other payment methods — BOLT11, BOLT12, HTTP 402, on-chain
6. Requests and user experience — QR codes and payment requests
7. Realtime and authentication — WebSockets, clear and blind auth
8. Nostr integration — mint backup

NUTs 00–06 are mandatory for wallets and mints. Later chapters are optional.

## Contributing

Display, grouping, and wrapping-prose improvements are welcome.

Do **not** edit files under `nuts/`. That tree is a clone of [cashubtc/nuts](https://github.com/cashubtc/nuts). If a NUT is wrong, unclear, or out of date, send the change upstream.

Editorial wrapping lives in `include/`. Reading order lives in `scripts/create.sh`.

## Development

You need [pandoc](https://github.com/jgm/pandoc/blob/main/INSTALL.md) and a LaTeX engine for PDF. On macOS:

```
brew install pandoc basictex
eval "$(/usr/libexec/path_helper)"
```

Clone this repo, then pull the NUTs and build:

```
make setup    # clones or updates cashubtc/nuts into ./nuts
make epub
make pdf
```

`make setup` also writes the upstream git commit into `include/git.md` so the book records which snapshot it was built from.

## License

The code that generates this book is public domain (see [LICENSE](LICENSE)). NUT content follows the license of [cashubtc/nuts](https://github.com/cashubtc/nuts).
