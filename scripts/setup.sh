#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ -d 'nuts' ];
then
    echo "Updating cashubtc/nuts"
    git -C nuts pull origin main
else
    echo "Pulling cashubtc/nuts"
    git clone https://github.com/cashubtc/nuts.git
fi

{
    echo "# Source snapshot"
    echo ""
    echo "This book was built from the following commit of [cashubtc/nuts](https://github.com/cashubtc/nuts). If something here disagrees with upstream, upstream wins."
    echo ""
    echo '```'
    git -C nuts log -n1
    echo '```'
} > include/git.md
