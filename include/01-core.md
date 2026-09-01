# Core protocol

This is the foundation. NUT-00 defines the cryptography and the models: proofs, blinded messages, and the rest of the vocabulary. NUT-01 and NUT-02 cover how a mint publishes keys and how keysets and fees work. NUT-06 is the mint's info endpoint, so a wallet can discover what a mint supports.

Wallets and mints `MUST` implement NUT-00 through NUT-06. The remaining mandatory specs — swap, mint, and melt — are in the next chapter, next to the optional payment features that extend them.

Later chapters in this book are optional.

**In this chapter**

- NUT-00 — Cryptography and models
- NUT-01 — Mint public keys
- NUT-02 — Keysets and fees
- NUT-06 — Mint info
