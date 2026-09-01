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

pdf_engine=xelatex
if command -v weasyprint >/dev/null 2>&1; then
    pdf_engine=weasyprint
fi

chapters=()
for input in "${inputs[@]}"
do
    if [[ "$format" == "pdf" && "$pdf_engine" == "xelatex" && "$input" == include/* && "$input" != include/pagebreak.md ]]; then
        chapters+=("include/pagebreak.md" "$input")
    else
        chapters+=("$input")
    fi
done

lua_filter=scripts/book.lua

function create_epub() {
    pandoc --metadata-file=metadata.yml \
           --epub-metadata=./metadata-epub.yml \
           --file-scope \
           --lua-filter="$lua_filter" \
           --split-level=2 \
           --toc --toc-depth=2 \
           --syntax-highlighting=monochrome \
           --resource-path=.:nuts \
           -s -o cashu-book.epub \
           "${chapters[@]}"
}

function create_pdf() {
    if [[ "$pdf_engine" == "weasyprint" ]]; then
        pandoc --metadata-file=metadata.yml \
               --file-scope \
               --lua-filter="$lua_filter" \
               --pdf-engine=weasyprint \
               --css=pdf.css \
               --toc --toc-depth=2 --metadata toc-title=Contents \
               --resource-path=.:nuts \
               -s -o cashu-book.pdf \
               "${chapters[@]}"
        return
    fi
    pandoc --metadata-file=metadata.yml \
           --file-scope \
           --lua-filter="$lua_filter" \
           --pdf-engine=xelatex \
           --wrap=none \
           -f markdown-strikeout-footnotes \
           --syntax-highlighting=none \
           --resource-path=.:nuts \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V mainfontfallback="Hiragino Mincho ProN,Apple Color Emoji" \
           -V monofontfallback="Menlo,Hiragino Sans,Apple Color Emoji" \
           -V geometry:margin="0.75in" \
           -s -o cashu-book.pdf \
           "${chapters[@]}"
}

function create_html() {
    mkdir -p docs
    rm -rf docs/book docs/media media
    cp images/cover.png docs/cover.png
    pandoc --metadata-file=metadata.yml \
           --file-scope \
           --lua-filter="$lua_filter" \
           --to chunkedhtml \
           --template=templates/chunked.html \
           --split-level=2 \
           --chunk-template='%i.html' \
           --toc --toc-depth=2 --metadata toc-title=Contents \
           --css=../web.css \
           --syntax-highlighting=none \
           --extract-media=media \
           --resource-path=.:nuts \
           -o docs/book \
           "${chapters[@]}"
    python3 scripts/inject-web-toc.py
    python3 scripts/fix-web-media.py
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
    html)
        echo "Building HTML"
        create_html
        ;;
    *)
        echo "Unknown format ${format:-<none>}" >&2
        echo "usage: $0 epub|pdf|html" >&2
        exit 1
        ;;
esac
