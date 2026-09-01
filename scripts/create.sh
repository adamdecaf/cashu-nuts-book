#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

inputs=(
    include/intro.md
    include/how-to-read.md
    include/git.md

    include/01-core.md
    nuts/00.md # Cryptography and Models
    nuts/01.md # Mint public keys
    nuts/02.md # Keysets and fees
    nuts/06.md # Mint info

    include/02-mint-melt-swap.md
    nuts/03.md # Swapping tokens
    nuts/04.md # Minting tokens
    nuts/05.md # Melting tokens
    nuts/08.md # Overpaid Lightning fees
    nuts/15.md # Partial multi-path payments (MPP)
    nuts/20.md # Signature on Mint Quote
    nuts/29.md # Batched Mint

    include/03-proofs-restore.md
    nuts/07.md # Token state check
    nuts/09.md # Signature restore
    nuts/12.md # DLEQ proofs
    nuts/13.md # Deterministic secrets
    nuts/19.md # Cached Responses

    include/04-spending-conditions.md
    nuts/10.md # Spending conditions
    nuts/11.md # Pay-To-Pubkey (P2PK)
    nuts/14.md # Hashed Timelock Contracts (HTLCs)
    nuts/28.md # Pay to Blinded Key (P2BK)

    include/05-payments.md
    nuts/23.md # Payment Method: BOLT11
    nuts/25.md # Payment Method: BOLT12
    nuts/24.md # HTTP 402 Payment Required
    nuts/30.md # Payment Method: Onchain

    include/06-requests.md
    nuts/16.md # Animated QR codes
    nuts/18.md # Payment requests
    nuts/26.md # Payment Request Bech32m Encoding

    include/07-realtime-auth.md
    nuts/17.md # WebSocket subscriptions
    nuts/21.md # Clear authentication
    nuts/22.md # Blind authentication

    include/08-nostr.md
    nuts/27.md # Nostr Mint Backup

    include/conclusion.md
)

format=${1:-}

missing=0
for input in "${inputs[@]}"
do
    if [[ ! -f "$input" ]]; then
        echo "error: missing $input" >&2
        missing=1
    fi
done
if [[ "$missing" -ne 0 ]]; then
    echo "Run 'make setup' first, or update the chapter list." >&2
    exit 1
fi

chapters=()
for input in "${inputs[@]}"
do
    if [[ "$format" == "pdf" ]]; then
        chapters+=("include/pagebreak.md" "$input")
    else
        chapters+=("$input")
    fi
done

function create_epub() {
    pandoc --metadata-file=metadata.yml \
           --epub-metadata=./metadata-epub.yml \
           --syntax-highlighting=monochrome \
           --resource-path=.:nuts \
           -s -o cashu-book.epub \
           "${chapters[@]}"
}

function create_pdf() {
    pandoc --metadata-file=metadata.yml \
           --toc --toc-depth 2 \
           --pdf-engine=xelatex \
           --columns=72 --wrap=auto \
           --listings -H listings-settings.tex \
           --resource-path=.:nuts \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V geometry:margin="0.75in" \
           -s -o cashu-book.pdf \
           "${chapters[@]}"
}

case "$format" in
    epub)
        echo "Building ePUB"
        create_epub
        ;;
    pdf)
        echo "Building PDF"
        create_pdf
        ;;
    *)
        echo "Unknown format ${format:-<none>}" >&2
        echo "usage: $0 epub|pdf" >&2
        exit 1
        ;;
esac
