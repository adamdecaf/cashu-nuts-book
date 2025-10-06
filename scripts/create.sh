#!/bin/bash

inputs=(
    include/intro.md
    include/git.md

    include/01-mandatory.md
    nuts/00.md # Notation, Utilization, and Terminology
    nuts/01.md # Mint public key exchange
    nuts/02.md # Keysets and fees
    nuts/03.md # Swap tokens
    nuts/04.md # Mint tokens
    nuts/05.md # Melting tokens
    nuts/06.md # Mint information

    include/02-optional.md
    nuts/07.md # Token state check
    nuts/08.md # Lightning fee return
    nuts/09.md # Restore signatures
    nuts/10.md # Spending conditions
    nuts/11.md # Pay to Public Key (P2PK)
    nuts/12.md # Offline ecash signature validation
    nuts/13.md # Deterministic Secrets
    nuts/14.md # Hashed Timelock Contracts (HTLCs)
    nuts/15.md # Partial multi-path payments
    nuts/16.md # Animated QR codes
    nuts/17.md # WebSockets
    nuts/18.md # Payment Requests
    nuts/19.md # Cached Responses
    nuts/20.md # Signature on Mint Quote
    nuts/21.md # Clear Authentication
    nuts/22.md # Blind Authentication
    nuts/23.md # BOLT11
    nuts/24.md # HTTP 402 Payment Required
    nuts/25.md # BOLT12

    include/conclusion.md
)

format=$1

chapters=()
for input in "${inputs[@]}"
do
    if [[ "$format" == "pdf" ]];
    then
        # The PDF engine needs page breaks inserted so each section is separated a bit more.
        chapters+=("include/pagebreak.md" "$input")
    else
        chapters+=("$input")
    fi
done

function create_epub() {
    # TODO(adam): Add epub flags
    # https://pandoc.org/MANUAL.html#option--epub-chapter-level
    pandoc --metadata-file=metadata.yml \
           --epub-metadata=./metadata-epub.yml \
           --highlight-style=monochrome \
           -s -o cashu-book.epub \
           "${chapters[@]}"
}

function create_pdf() {
    # TODO: needs "brew install basictex"
    # and   eval "$(/usr/libexec/path_helper)"

    pandoc --metadata-file=metadata.yml \
           --toc --toc-depth 2 \
           --pdf-engine=xelatex \
           --columns=72 --wrap=auto \
           --listings -H listings-settings.tex \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V geometry:margin="0.75in" \
           -s -o cashu-book.pdf \
           "${chapters[@]}"

    # -V mainfontfallback="Apple Color Emoji"
    # -V monofontfallback="Apple Color Emoji"
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
        echo "Unknown format $format"
        exit 1
        ;;
esac
