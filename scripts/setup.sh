#!/bin/bash

if [ -d 'nuts' ];
then
    echo "Updating cashubtc/nuts"
    cd nuts
    git pull origin main
    cd - 2>&1 > /dev/null
else
    echo "Pulling cashubtc/nuts"
    git clone https://github.com/cashubtc/nuts.git
fi

# Include the latest git commit in the book
echo "## Git Commit" > ./include/git.md
echo "To provide readers with the most up-to-date information, this page showcases the latest git commit from the cashubtc/nuts repository on GitHub. This commit log offers a snapshot of the most recent changes, updates, and enhancements made to the Notation, Usage, and Terminology (NUTs). By incorporating this information, readers can gain insight into the ongoing development and evolution of Cashu ecash, ensuring they are informed about the latest contributions and modifications from the community. This inclusion underscores the dynamic nature of the project and highlights the collaborative efforts driving its progress." >> ./include/git.md
echo "" >> ./include/git.md

cd nuts/
commit=$(git log -n1)
echo '```shell' >> ../include/git.md
echo "$commit" >> ../include/git.md
echo '```' >> ../include/git.md
cd - 2>&1 > /dev/null
