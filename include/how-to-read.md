# How to read this book

The NUTs were written as numbered documents. That numbering is still how implementations refer to them — NUT-04, NUT-11, and so on — but it is not the best order for a first read.

I start with the core protocol: what a token is, how keys work, and how a mint describes itself. Then I walk through the three operations every wallet cares about: mint, melt, and swap. After that come wallet state, spending conditions, Lightning and other payment methods, payment requests, realtime and auth, and a small Nostr chapter.

A note on mandatory versus optional: wallets and mints `MUST` implement NUT-00 through NUT-06. Those specs are split across the first two chapters, because mint, melt, and swap sit more naturally with the later payment NUTs than with cryptography. Everything from NUT-07 onward is optional. You can skip a later chapter if you are not implementing that feature.

I have not edited the NUT text. If a spec looks wrong, the fix belongs in [cashubtc/nuts](https://github.com/cashubtc/nuts), not here.

Read front to back if you are new. Jump by chapter if you already know the protocol and need one topic.
