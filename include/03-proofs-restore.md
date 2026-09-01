# Proofs, restore, and wallet state

Proofs are the tokens in your wallet. This chapter is about keeping them honest and recoverable.

NUT-07 lets a wallet ask a mint whether a proof is spent. NUT-09 restores signatures after you recover a seed. NUT-12 adds DLEQ proofs so you can check a mint's signatures offline. NUT-13 derives secrets deterministically from a seed phrase, which is what makes restore possible. NUT-19 caches mint responses so retries do not double-spend you.
