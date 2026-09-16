# Source snapshot

This book was built from the following commit of [cashubtc/nuts](https://github.com/cashubtc/nuts). If something here disagrees with upstream, upstream wins.

```
commit 8f244be801a7de5811bd230cc4bc78439f4948dc
Author: Rob Woodgate <robwoodgate@users.noreply.github.com>
Date:   Tue Sep 15 21:20:54 2026 +0100

    NUT-29: use valid curve points in the batch mint example (#405)
    
    Two example output B_ values were not valid secp256k1 points, which
    trips implementations that validate points on parse.
```
