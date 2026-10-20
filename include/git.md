# Source snapshot

This book was built from the following commit of [cashubtc/nuts](https://github.com/cashubtc/nuts). If something here disagrees with upstream, upstream wins.

```
commit 48b6fc26ffba5e2bc988d615f777b109b712cdfe
Author: Kelbie <kevin@kelbie.me>
Date:   Tue Oct 20 12:16:55 2026 +0100

    Editorial pass: broken anchors, invalid JSON, and names no NUT defines (#454)
    
    * Normalize formatting in spec headers, callouts and code blocks
    
    Cosmetic only; no wording, structural or normative change.
    
    - NUT-23, NUT-25, NUT-30: comma-separate the `depends on:` lists
      ("NUT-04 NUT-05 NUT-20" -> "NUT-04, NUT-05, NUT-20"). Without the
      separators the list reads as a single token. Of the seven NUTs with
      more than one dependency, four (NUT-11, NUT-14, NUT-22, NUT-24)
      already use commas; this makes it all seven.
    - NUT-02: `> [!CRITICAL]` is not one of GitHub's five alert types
      (NOTE, TIP, IMPORTANT, WARNING, CAUTION), so the callout renders as
      a plain blockquote with the literal text `[!CRITICAL]` on its first
      line. Use `CAUTION`, which the repo already uses nine times and
      which is GitHub's type for the negative consequences of an action.
      This is the only invalid alert type in the tree.
    - NUT-11: collapse the double space before `B_0` in the swap `msg`
      concatenation example. The melt variant eight lines below is the
      same construction with single spaces, the prose under both says
      "`||` denotes string concatenation", and the SIG_ALL test vector
      shows the concatenated message with no whitespace at all. It is the
      only double space around `||` in the repo, and an unexplained one in
      a byte-concatenation example invites the reader to wonder whether it
      is significant.
    - NUT-27: retag the derivation example from `javascript` to
      `typescript`. The block uses type annotations (`mnemonic: string`,
      `Uint8Array`) and fails to parse as JavaScript, so the previous tag
      both mislabeled the example and kept Prettier from formatting it.
      The reflowed return type is Prettier's output for the corrected tag.
    
    * Use the American spellings the rest of the tree already uses
    
    This repo has no written language rule, but the committed specs are
    consistently American: 81 words in the -ize family against 7 in the
    -ise family, and "behavior", "labeled", "fulfill", "while" and "among"
    appear with no British counterpart anywhere in the tree. There are no
    occurrences of colour, licence, centre, analyse, cancelled or
    modelling either.
    
    Five outliers, all outside headings:
    - NUT-00 holds four of the seven -ise words, two of them in the binary
      token encoding where `<serialised_token>` sits next to `serialize`d
      prose elsewhere in the same document. Spelling the same concept two
      ways in one spec is a needless reading cost.
    - NUT-03: "totalling" -> "totaling", the same doubled-l pattern the
      tree already resolves the American way in "labeled".
    
    No wording or normative change.
    
    Note: `standardised` and `finalises` in NUT-18 remain, as does
    `Public Key Canonicalisation` in NUT-11 and `Signalling` in NUT-21.
    The last two are headings, so changing them moves a published anchor
    and is left for a deliberate decision.
    
    * Copy-edit prose: grammar, agreement and dropped words
    
    Editorial only. Every change here leaves the meaning of the sentence
    unchanged; anything that renames a field, moves a heading or alters a
    requirement is in a separate commit.
    
    Subject/verb agreement, where the singular/plural mismatch makes the
    sentence contradict the data it describes:
    - NUT-00: "an encrypted secret and an amount is sent" -> "are sent".
    - NUT-00: "Token can be transmitted" -> "Tokens can be transmitted".
    - NUT-02: "the sum of the individual fees are 300 ppk" -> "is".
    - NUT-02: "For all new keyset returned here ... get it ... and store
      it" -> "For each new keyset". The two singular pronouns after it
      are already correct, so make the subject singular rather than the
      pronouns plural.
    - NUT-13: "swap proof that are still locked" -> "proofs".
    - NUT-17: "the parameters ... is only the subscription ID" -> "are".
    - NUT-19: "This allows wallet to replay requests ... and allow it to
      recover" -> "allows wallets ... and allows them to recover".
    
    Dropped or doubled words that change what the sentence says:
    - NUT-08: "the the `inputs` provided were greater then" -> "the
      `inputs` provided were greater than"; "received form the wallet" ->
      "from"; "MUST return the all blank signatures" -> "all blind
      signatures". The rest of that sentence and the two after it already
      say "blind signatures" four times; "blank" attaches to outputs
      everywhere else in the NUT, and a blank output is defined as having
      amount 0, so "blank signatures with a value greater than 0" cannot
      be what was meant.
    - NUT-02: "keysets which IDs collide" -> "whose IDs collide".
    - NUT-02: "the next larger integer (that that can be represented)" ->
      drop the doubled "that".
    - NUT-08: "the actual fee was `100 sat`, i.e, the overpaid fee" ->
      "i.e.,".
    - NUT-11: "is greater or equal to the number specified in `n_sigs`"
      -> "greater than or equal to" (2 occurrences, the `n_sigs` and
      `n_sigs_refund` rules).
    - NUT-17: "a `WsRequest` with a `filters` chosen to be the a `Proof.Y`
      value" -> "the `Proof.Y` value".
    - NUT-03: "the list requested outputs" -> "the list of requested
      outputs"; "`Carols`'s wallet" -> "`Carol`'s wallet".
    - NUT-05: "`amount` and `unit` the amount and unit" -> "are the amount
      and unit".
    - NUT-13: "a KDF which output is used" -> "whose output is used"; "the
      wallet can either requests the mint ... or by downloading the entire
      database" -> "can either request ... or download" (the correlative
      needs two matching verbs, so fixing only the first one leaves the
      sentence broken); "for theses `BlindedMessages`" -> "these".
    - NUT-16: "we use animated QR codes are based on the UR protocol" ->
      "we use animated QR codes based on".
    - NUT-17: "subscriptions that is isn't interested in" -> "that it
      isn't interested in".
    - NUT-18: "The execute the payment" -> "To execute the payment".
    - NUT-19: "loss of funds to due network errors" -> "due to".
    - NUT-22: "even if request results in an error" -> "even if the
      request results in an error".
    - NUT-21, NUT-22: "matches any path starting `/v1/`" -> "starting
      with `/v1/`" (4 occurrences). The sibling bullets in the same lists
      already read "matches any path that starts with `/v1/auth/`".
    
    Word choice and articles:
    - NUT-04, NUT-05: "The currently specified models are" -> "methods".
      The heading two lines above is "Supported methods" and the clause
      before it says "payment methods"; "models" has no referent.
    - NUT-07: "This can be achieved with for example mutex lock" -> "with,
      for example, a mutex lock".
    - NUT-10: "treated as a regular anyone-can-spend tokens" -> "as
      regular anyone-can-spend tokens".
    - NUT-10: "The optional `tags` field, is an array" -> drop the comma
      splitting subject from verb.
    - NUT-12: "returns the DLEQ proof additional to the blind signature"
      -> "in addition to".
    - NUT-13: "uses the `seed`, to derive" -> drop the stray comma.
    - NUT-17: "is a enum" -> "is an enum".
    - NUT-24: "a `X-Cashu` header" -> "an `X-Cashu` header".
    - NUT-00: "uint32 counter(byte order little endian)" -> add the
      missing space before the parenthesis.
    - NUT-00: "Values in these specification" -> "specifications".
    - NUT-01: "mint ([NUT-04][04]) and melt([NUT-05][05])" -> add the
      missing space before the parenthesis.
    - NUT-20: "the requested `amount`,`unit`, and `description`" -> add
      the missing space after the comma.
    
    Four of these land inside a **MUST** or **SHOULD** sentence: the
    NUT-08 "greater then" and "blank signatures" fixes, the NUT-22
    "even if the request" fix, and the NUT-07 mutex clause. None changes
    the requirement; the NUT-08 pair resolves readings that cannot be
    satisfied as written.
    
    * Fix heading levels and intro placement
    
    Text is unchanged; only heading depth and one paragraph's position move.
    
    - NUT-07: "Token states" was `###` while its sibling "Use cases" is
      `##`, so a top-level section of the spec was nested under nothing.
      Promote it to `##`, and demote "Example 1"/"Example 2" from `####`
      to `###` so they sit one level under "Use cases" instead of skipping
      a level. This also makes the generated table of contents and the
      rendered page outline match the document's actual structure.
    - NUT-24: same problem. "Server response" and "Client payment" were
      `###` while "Payment response" below them is `##`, which reads as if
      the first two were subsections of the intro. Promote both to `##`.
    - NUT-29: move the one-line summary below the `---` divider. Every
      other NUT puts the status badges (`optional`, `depends on:`,
      `uses:`) above the divider and the prose below it; NUT-29 had the
      summary wedged between the badges and the rule.
    
    Checked against every NUT: NUT-29 was the only file with prose above
    the first divider.
    
    Scope: these are the places where a heading level misrepresents the
    document's own section structure. Several files nest deeper than
    their parent implies (NUT-00, NUT-12, NUT-13, NUT-29's examples, and
    three files under tests/). Those need a decision about what the
    hierarchy should be rather than a level shift, so they are left
    alone.
    
    * Repair broken cross-references and anchors
    
    Each of these resolved to nothing. Verified by computing GitHub's
    heading slugs for every heading in the tree and resolving every link
    and reference against them: this takes the repo from seven broken
    references on main to zero.
    
    - NUT-09 used `[NUT-06][06]` in the body but had no `[06]` definition
      in its link block, so the reference rendered as literal text. Add
      `[06]: 06.md`.
    - NUT-23 used `[NUT-02][02]` and `[NUT-08][08]` with no definitions
      for either. Add both.
    - NUT-02's `[TokenV3]` pointed at `github.com/cashuBTC/nuts` (the
      canonical org is `cashubtc`) and at the anchor `#023---v3-tokens`,
      which was correct when NUT-00's heading was numbered but has not
      matched since it became "### V3 tokens". The definition is currently
      unused, like most of the link blocks in this repo, so nothing
      renders wrong today -- it is repaired rather than removed so it is
      correct for the first use.
    - NUT-11 linked to `#Multisig`. Slugs are lowercased, and fragment
      matching is case-sensitive, so the link does not scroll. The heading
      is "## Multisig", so the anchor is `#multisig`.
    - NUT-13 linked to `#legacy-derivation-deprecated`. The heading is
      "### Legacy Derivation (For Keyset Version `00`)", which slugs to
      `#legacy-derivation-for-keyset-version-00` under both GitHub's
      slugger and the MkDocs build. This one matters more than the others:
      it is the pointer a wallet follows to find the derivation rules for
      V1 keysets.
    
    * Refer to types, fields and states by the names they are defined under
    
    Each of these names does not exist, or exists with a different
    spelling, in the spec that defines it. A reader who greps for the name
    as written finds nothing.
    
    Types and fields:
    - NUT-08: "the new `output` field carries the `BlindMessages`" ->
      "the new `outputs` field carries the `BlindedMessages`". The request
      body shown directly above it has an `outputs` key, and NUT-00 says
      "an array `[BlindedMessage]` is also referred to as
      `BlindedMessages`".
    - NUT-08: "produces a number of `BlindedMessage` which are similar" ->
      "`BlindedMessage`s", the form the same file already uses for
      `BlindSignature`s.
    - NUT-09: `<Array[BlindedMessages]>` -> `<Array[BlindedMessage]>` in
      both `PostRestoreRequest` and `PostRestoreResponse`. These were the
      only two plural element types in the repo; the other 38 `Array[...]`
      annotations are all singular. This finishes a review suggestion on
      these exact two lines in #87, which asked to "keep naming exactly
      consistent with NUT-00" -- the `signatures` half was applied and the
      `outputs` half was not.
    - NUT-10: `BlindMessages` -> `BlindedMessages` (2 occurrences).
      `BlindMessage`, without the "ed", is defined nowhere.
    - NUT-12: `hash(x: <Array<[PublicKey]>) -> bytes` ->
      `hash(x: Array[PublicKey]) -> bytes`. The original had unbalanced
      angle brackets and mixed two generic syntaxes.
    - NUT-15, NUT-12, NUT-17: `` `PostMeltQuoteBolt11Request`'s ``,
      `` `BlindSignature`'s `` and `` `WsNotification`'s `` are plurals,
      not possessives. Drop the apostrophes. (`` `Proof`'s `Y` `` and
      `` `Proof`'s `secret` `` are real possessives and are left alone.)
    - NUT-20: two request types named in prose do not exist. The error
      text said `PostMintBolt11QuoteRequest` and the `pubkey` paragraph
      said `PostMintRequest`; the types this NUT defines are
      `PostMintQuoteBolt11Request` and `PostMintBolt11Request`.
    - NUT-07, NUT-08, NUT-09, NUT-10, NUT-11, NUT-12 and NUT-14 each
      introduce their settings block with "The [NUT-06][06]
      `MintMethodSetting` indicates support for this feature", but what
      follows is a `{"N": {"supported": <bool>}}` entry of NUT-06's
      `nuts` object. `MintMethodSetting` is defined in NUT-04 as
      `{method, unit, method_name, min_amount, max_amount, options}` and
      has no `supported` key; in NUT-08, a melt feature, it is wrong
      twice over. NUT-06 gives the `{"supported": bool}` entry no type
      name of its own -- it only says "the settings are defined in each
      NUT separately" -- so name `nuts`, which NUT-06 does define and
      NUT-19 already refers to in prose.
    - NUT-01: `<mint_pubkey_1>` -> `<mint_pubkey_i>`. The sentence is
      about the key for each `<amount_i>`, so the index must vary; the
      `K_i` it equates to in the same clause already does. The literal
      `<mint_pubkey_1>` in the map template earlier in the sentence is
      correct and unchanged. #119 already expanded `<amount_2> : ...` into
      `<amount_2> : <mint_pubkey_2>` in the same sentence for this reason
      and left the trailing one behind.
    
    States:
    - NUT-07: "cannot be used in another transaction until it is `live`
      again" -> "until it is `UNSPENT` again". `live` is not one of the
      three states the surrounding list defines. The sentence is about a
      `PENDING` proof becoming usable again, and `UNSPENT` is the only
      state in which it is usable; the same file already says a failed
      melt means the mint returns `UNSPENT`.
    
    Encodings and external names:
    - NUT-00: "a utf-8 encoded string" -> "a UTF-8-encoded string",
      the form the same file already uses for the secret message `x`.
    - NUT-11: `amount` "is a UTF-encoded string" -> "UTF-8-encoded"
      (2 occurrences). "UTF-encoded" names no encoding.
    - NUT-22: `base64_url` -> `base64url`, matching `base64url` and
      `authA[base64url_authproof_json]` in the two lines above it. All
      three came from #353 in one diff; the padding note is a near-verbatim
      lift of NUT-00's sentence and `base64_url` is the spelling the
      transcription introduced. (NUT-00 and NUT-18 say `base64_urlsafe`,
      so a cross-document inconsistency remains either way; `base64_url`
      is the one spelling nothing uses.)
    - NUT-21: "Oauth 2.0 Access token" -> "OAuth 2.0 access token", the
      form used everywhere else in that NUT.
    - NUT-26: "LightningOffers (BOLT12)" -> "Lightning Offers (BOLT12)".
    
    NUT-24 field names:
    - The decoded payment request in NUT-24 has keys `a`, `u` and `m`, but
      the prose below it referred to the `mints` array, the `unit` and the
      `amount`. Use `m`, `u` and `a` so the requirements name the keys a
      server actually receives, keeping the English word alongside each so
      the sentences still read. NUT-18 uses the same short names in its
      own prose, and NUT-24's own field list was switched to the short
      keys while it was being drafted without the prose following.
    
    Four lines carry a grammar error alongside the name being fixed, and
    are corrected in the same edit rather than split across commits:
    NUT-10's "the outputs to which the inputs are spent to" (2
    occurrences), NUT-12's "representations of each `PublicKey` is
    concatenated" -> "are concatenated", and NUT-24's "a HTTP `400`" ->
    "an HTTP `400`".
    
    * Make JSON examples parse and match their own schemas
    
    Implementers copy these blocks. Each one here had a syntax error, or
    disagreed with the schema printed a few lines above it. Some of the
    blocks are deliberate fragments of the NUT-06 `nuts` object and still
    do not stand alone as JSON; this only removes the errors inside them.
    
    Syntax:
    - NUT-01: `GetKeysResponse` was missing the comma after
      `"final_expiry"`, so the object ended mid-list.
    - NUT-08: two trailing commas after the last `"C"` member of the melt
      request `inputs`. This block is concrete, placeholder-free JSON in a
      curl body, so it goes from failing `json.loads` to parsing.
    - Trailing commas before a closing `}` or `]`, which are invalid in
      every JSON parser: NUT-00 (`Proof`, TokenV4), NUT-03
      (`PostSwapRequest`), NUT-07 (`PostCheckStateRequest`,
      `PostCheckStateResponse`), NUT-10 (`Secret`), NUT-18
      (`PaymentRequest`), NUT-19 (`cached_endpoints`, 2 occurrences),
      NUT-20 (`Settings`).
    - NUT-17: the `WsSubscribeParams` example closed with `],},` -- a
      trailing comma and one level of over-indentation. Re-indent to match
      the surrounding block and drop the comma.
    - NUT-15: `MultipathPaymentSetting` opened an object and then put a
      bare array inside it with no key. The example immediately below it
      already uses `"methods"`, and so do both mints: CDK's
      `nut15::Settings` serializes `{"methods": [...]}` and Nutshell
      builds `dict(methods=...)`. Add the key.
    
    Formatting:
    - NUT-20: drop a stray blank line before the closing `}'` of the mint
      curl body.
    
    Disagrees with the schema above it:
    - NUT-17: the JSON-RPC error example used `"id": "1"` (string). The
      `WsResponse` schema says `"id": <int>`, the request and notification
      examples both use bare integers, and Nutshell and CDK type the id as
      an integer on the error response too. Only the example changes; the
      schema is untouched.
    - NUT-20: the `PostMintQuoteBolt11Response` schema contradicts both
      NUTs it is defined against.
    
      NUT-20 declares `depends on: NUT-04`, and NUT-04's common mint quote
      response already specifies `"method": <str>` ("the payment method of
      the quote") and `"expiry": <int|null>` ("`null` if it does not
      expire") alongside NUT-20's own `pubkey`. NUT-20 omits `method` and
      types `expiry` as `<int>`.
    
      It also says it is "the same as the `bolt11` mint quote response in
      NUT-23 except for `pubkey`" -- a sentence #377 wrote when it updated
      NUT-20 and NUT-23 together -- but omits NUT-23's `amount`. The
      schema is maintained as a mirror and has fallen behind twice: #258
      created NUT-23 with `amount` and a nullable `expiry` while touching
      only NUT-04, NUT-05 and NUT-23; #387, described as "add a `method`
      field to all quote responses", touched NUT-04, NUT-05, NUT-23,
      NUT-25 and NUT-30. Only `unit` was ever caught up, by hand. NUT-25
      and NUT-30 are already correct, so NUT-20 is the last one.
    
      So restore `amount`, `method` and `expiry`'s nullability, and add
      `amount`, `unit` and `method` to the example to match.
    
      Both mints send all three: Nutshell types `amount`, `unit` and
      `method` non-Optional on `PostMintQuoteResponse`, and CDK carries
      `// REVIEW: This is now required in the spec` on `amount`. CDK uses
      one `MintQuoteBolt11Response` for locked and unlocked quotes, so a
      NUT-20 quote is already this exact shape on the wire.
    
      `method` matters most here. Issue #378 asked for it because a quote
      arriving over a NUT-17 websocket has no endpoint to identify it, and
      #372 had just replaced the method-specific subscription kinds with a
      generic `mint_quote`, so the payload is the only signal left.
    
    - NUT-30: the three onchain melt quote examples omitted `"method"`,
      and each `fee_options` entry omitted `"fee_index"`. Both are in the
      schema, and `fee_index` in particular is the value the wallet has to
      echo back in the melt request -- an example without it does not show
      where that value comes from.
    
    Inconsistent example data:
    - NUT-29: the batch mint example sends `POST /v1/mint/bolt12/batch`,
      but it mints the two quotes the quote-check example above it
      created. Those quotes were checked at `/v1/mint/quote/bolt11/check`,
      each carries `"request": "lnbc..."`, and their amounts 100 and 50
      are this example's `quote_amounts`. Two paragraphs above the
      request, the same NUT requires every quote in a batch to be for the
      `method` in the URL, so as written the example breaks its own rule.
      Nutshell serves `/v1/mint/bolt11/batch`. Use bolt11.
    - NUT-23: the melt curl used quote `019e6d5a-2347-7000-813e-
      a11ea6e419e7` while the quote response, the state-check curl and the
      melt response either side of it all use `019e6d5a-2347-7000-8449-
      370fefb42fed`. Use the walkthrough's quote so the example reads as
      one flow.
    
    * tests: fix vectors and prose that contradict the specs they test
    
    Transcription errors that would fail a strict parser or mislead a
    reader. No vector payload changes.
    
    NUT-13 vectors:
    - `"keyest_id_int"` -> `"keyset_id_int"`, the name NUT-13 gives the
      integer representation. A harness keying off this field name would
      get nothing.
    - Two links to `[NUT-13](13.md)` resolved relative to `tests/`, i.e.
      to `tests/13.md`, which does not exist. Use `../13.md`, as
      `tests/20-test.md` already does.
    
    NUT-28 vectors:
    - `r10 "9de35..."` was missing its colon, so the line did not parse
      like the ten `r0:`..`r9:` lines above it.
    - The two derivation comments read `(p + r0) mod n` and
      `(-p + r0) mod n`, but the lists under them are indexed 0 to 10 and
      each entry uses its own `r`. Recomputing the vectors confirms it:
      every entry is `SHA256("Cashu_P2BK_v1" || Zx || i)` with its own
      `i`, so the comment is right for entry 0 and wrong for the other
      ten. Use `rᵢ`, the notation NUT-28 itself uses.
    - "in the `p2pk_e`metadata field" -> add the missing space.
    
    NUT-11 vectors:
    - The request bodies are labelled `SwapRequest` (9 occurrences) and
      `MeltRequest` (4). Neither name exists: NUT-03 defines
      `PostSwapRequest`, and NUT-11 itself names the two bodies
      `PostSwapRequest` and `PostMeltRequest` in the sentence that sets
      up these vectors. Use the names NUT-11 uses.
    - "a valid sig_all signature" -> "a valid `SIG_ALL` signature". The
      flag is `SIG_ALL` in NUT-11 and in all fifteen other mentions in
      this file, including the two `MeltRequest` headings below it.
    
    NUT-02 vectors:
    - The Version 1 intro and the first `Keyset id:` line had no blank
      line between them, so they render as one run-on paragraph. The
      Version 2 intro directly below is separated correctly.
    
    NUT-00 vectors:
    - "test vectors for the the blinded secret" -> drop the doubled word.
    - The TokenV3 serialization section is introduced as "JSON-formatted
      v3 token**s** and their serialized counterpart**s**", but a single
      vector follows. The identical sentence over the TokenV4 section is
      correct, because two vectors follow it.
    - The single-keyset TokenV4 vector labels its output `Encoded:` where
      the TokenV3 vector above it and the multi-keyset TokenV4 vector
      below it both say `Serialized:`, under a heading that says
      "Serialization".
    
    * Fix endpoint paths and the blinding-factor derivation path
    
    Four places where following the text literally produces a wrong
    request or a wrong key. Grouped together because they are the changes
    in this pass that can actually break an implementation.
    
    - NUT-08 told the wallet to ask for the `fee_reserve` by calling
      `POST /v1/melt/quote`. NUT-05 defines the melt quote endpoint as
      `POST /v1/melt/quote/{method}`, and NUT-23 uses
      `POST /v1/melt/quote/bolt11`. Since the sentence is specifically
      about a bolt11 invoice, and already sends the request that follows
      to `POST /v1/melt/bolt11`, use `POST /v1/melt/quote/bolt11`.
      `POST /v1/melt/quote` is not an endpoint any mint serves.
    
    - NUT-02 gave `/v1/swap` and `/v1/melt` as examples of transactions
      with ecash inputs. NUT-05 defines the melt endpoint as
      `POST /v1/melt/{method}`; `/v1/melt` is not served either. Use
      `/v1/melt/{method}`.
    
    - NUT-22 wrote the blind-auth keysets endpoint as
      `GET v1/auth/blind/keysets`, with no leading slash. The other three
      endpoint blocks in the same NUT (`/v1/auth/blind/keys`,
      `/v1/auth/blind/keys/{keyset_id}`, `/v1/auth/blind/mint`) all have
      it, and the section above them says the endpoints start with a
      prefix `/v1/auth/`. A relative path resolves against whatever the
      client's base is.
    
    - NUT-13's legacy derivation printed:
          secret_derivation_path = m/129372'/0'/{keyset_k_int}'/...
          r_derivation_path      = m/129372'/0'/{keyset_id_k_int}'/...
      The two paths differ only in the final index (0 for the secret, 1
      for the blinding factor), so the account level must be the same
      variable in both. The sentence directly under them confirms it:
      "`{keyset_k_int}` and `{counter_k}` are the only variables that can
      change". So do the path template and the worked Python and
      TypeScript examples earlier in the same NUT, which derive both
      paths from one value. A wallet that read `{keyset_id_k_int}` as a
      distinct value would derive blinding factors under a different
      branch and fail to restore its own ecash.
    
      The same paragraph then used `keyset_id_k_int` again when naming
      the value, so fix both occurrences rather than leave the typo half
      corrected. A third spelling, `keyset_id_int`, is the separate name
      the mapping section below defines for the integer conversion, and
      is left alone.
```
