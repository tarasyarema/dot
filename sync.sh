git pull origin master

pwd=$(pwd)

function full() {
    return "$(readlink -f $1)"
}

if [ -f ~/.aliases ]; then
    mv ~/.aliases ~/.aliases.dot.bak
fi

cp $(readlink -f config/.aliases) ~/.aliases

