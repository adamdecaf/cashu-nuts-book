# Minting, melting, and swapping

These are the three verbs of Cashu.

You mint to turn a payment (usually Lightning) into ecash proofs. You melt to turn proofs back into a payment. You swap to split, combine, or hand proofs to someone else without going out to Lightning at all.

NUT-03, NUT-04, and NUT-05 are mandatory. The rest of this chapter is optional: returning overpaid Lightning fees, paying an invoice from several proofs at once, signing mint quotes so a mint cannot be griefed, and batching mint operations.

The error table at the end is not a numbered NUT. It is the shared list of numeric codes mints return from mint, melt, swap, and a few later specs. Those documents link here; this is the lookup.

**In this chapter**

- NUT-03 — Swapping tokens
- NUT-04 — Minting tokens
- NUT-05 — Melting tokens
- NUT-08 — Overpaid Lightning fees
- NUT-15 — Partial multi-path payments
- NUT-20 — Signature on mint quote
- NUT-29 — Batched mint
- NUT Errors — shared mint error codes
