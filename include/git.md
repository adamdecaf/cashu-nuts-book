# Source snapshot

This book was built from the following commit of [cashubtc/nuts](https://github.com/cashubtc/nuts). If something here disagrees with upstream, upstream wins.

```
commit 75ce1c3e453a8279103470e2f86872d043d6910c
Author: Rob Woodgate <robwoodgate@users.noreply.github.com>
Date:   Thu Nov 19 11:16:37 2026 +0000

    NUT-01, NUT-02, NUT-08: accepted outputs are signed after keyset rotation; zero-value signatures MUST be omitted (#436)
    
    * NUT-01, NUT-02, NUT-08: accepted outputs are signed after keyset rotation
    
    A mint checks `active` when it accepts a request, then signs the
    outputs with their keyset even if it is inactivated before signing
    completes. For melts this keeps NUT-08 change signable when the keyset
    rotates during the payment.
    
    Zero-value change signatures MUST be omitted, and wallets unblind each
    change signature with the keyset named by its id.
    
    ---------
    
    Co-authored-by: tsk <tsk@thesimplekid.com>
```
